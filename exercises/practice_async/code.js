// Part 1
Promise.resolve("Done").then(console.log);

// Part 2
let start = Date.now();
let diff = () => Date.now() - start;

setTimeout(() => {
    console.log("Timeout ran at ", diff());
}, 20);

while (Date.now() < start + 50) {}

console.log("Wasted time until", diff());