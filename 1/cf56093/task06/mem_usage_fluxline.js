var os = require('os');
var totalmem=os.totalmem();
var freemem=os.freemem();

var hrTime = process.hrtime.bigint()


console.log('mem_usage,totalmem='+totalmem+',freemem='+freemem+',mem_usage_percent='+Math.round((totalmem-freemem)/totalmem*100)+' '+Date.now()+'000000') 
