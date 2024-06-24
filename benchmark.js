const crypto = require('crypto');
const performance = require('perf_hooks').performance;

const start = performance.now();

const array = {};
for (let i = 0; i < 1000000; i++) {
    array[i] = crypto.createHash('sha256').update(i.toString()).digest('hex');
}

const end = performance.now();
console.log(`Execution time: ${end - start} milliseconds`);
