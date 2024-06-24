const crypto = require('crypto');

function sha256(data) {
    return crypto.createHash('sha256').update(data).digest('hex');
}

const start = process.hrtime.bigint();

const array1 = {};
for (let i = 0; i < 1000000; i++) {
    array1[i] = sha256(i.toString());
}

const array2 = Object.values(array1).map(hash => hash.slice(1, -1));
const finalHash = sha256(array2.join(''));

console.log(`Final hash: ${finalHash}`);

const end = process.hrtime.bigint();
const duration = Number(end - start) / 1e6;

console.log(`Execution time: ${Math.round(duration)} milliseconds`);
