import fs from 'node:fs';
import path from 'node:path';

const repoRoot = process.cwd();
const downloadsDir = path.join(repoRoot, 'downloads');
const apkDir = path.join(downloadsDir, 'apk');
const latestApkPath = path.join(downloadsDir, 'latest.apk');
const latestJsonPath = path.join(downloadsDir, 'latest.json');

const sourceArg = process.argv[2];
if (!sourceArg) {
  console.error('Usage: npm run apk:publish -- "<path-to-apk>"');
  process.exit(1);
}

const sourceApkPath = path.resolve(repoRoot, sourceArg);
if (!fs.existsSync(sourceApkPath)) {
  console.error(`Source APK not found: ${sourceApkPath}`);
  process.exit(1);
}

if (!sourceApkPath.toLowerCase().endsWith('.apk')) {
  console.error('Source file must be an .apk');
  process.exit(1);
}

fs.mkdirSync(apkDir, { recursive: true });

const versionPattern = /^TapNEat\.v(\d+)\.apk$/i;
const existingVersions = fs
  .readdirSync(apkDir, { withFileTypes: true })
  .filter((entry) => entry.isFile())
  .map((entry) => {
    const match = entry.name.match(versionPattern);
    return match ? Number.parseInt(match[1], 10) : 0;
  })
  .filter((num) => Number.isFinite(num) && num > 0);

const nextVersion = existingVersions.length > 0 ? Math.max(...existingVersions) + 1 : 1;
const versionedName = `TapNEat.v${nextVersion}.apk`;
const versionedPath = path.join(apkDir, versionedName);

fs.copyFileSync(sourceApkPath, versionedPath);
fs.copyFileSync(sourceApkPath, latestApkPath);

const metadata = {
  latestVersion: nextVersion,
  latestFile: `apk/${versionedName}`,
  latestDownload: 'latest.apk',
  publishedAt: new Date().toISOString(),
};

fs.writeFileSync(latestJsonPath, `${JSON.stringify(metadata, null, 2)}\n`, 'utf8');

console.log('APK published successfully.');
console.log(`Version: v${nextVersion}`);
console.log(`Versioned file: downloads/apk/${versionedName}`);
console.log('Latest file: downloads/latest.apk');
