const commonPorts: number[] = [
  1080,
  1100,
  1241,
  1352,
  1337,
  2810,
  6969,
  1738,
  2710,
  6961,
  1433,
  1434,
  1521,
  1944,
  2301,
  3000,
  3128,
  3306,
  4000,
  4001,
  4002,
  4100,
  5000,
  5432,
  5800,
  5801,
  5802,
  6346,
  6347,
  7001,
  7002,
  8080,
  8443,
  8888,
  30821,
];

for (let port = 1; port <= 1024; port++) {
  commonPorts.push(port);
}
let txt = ``;
for (const port of commonPorts) {
  txt += `  - DST-PORT,${port},Unknown\n`;
}
// remove last \n
txt = txt.slice(0, -1);
console.log(txt);
