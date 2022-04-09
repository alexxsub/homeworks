os=require('os');

function cpuAverage() {
  var totalIdle = 0, totalTick = 0;
  var cpus = os.cpus();

  for(var i = 0, len = cpus.length; i < len; i++) {
    var cpu = cpus[i];
    for(type in cpu.times) {
      totalTick += cpu.times[type];
   }

    totalIdle += cpu.times.idle;
  }
  return {idle: totalIdle / cpus.length,  total: totalTick / cpus.length};
}


function CPULoad(avgTime, callback) {
  this.samples = [];
  this.samples[1] = cpuAverage();
  this.refresh = setInterval(() => {
    this.samples[0] = this.samples[1];
    this.samples[1] = cpuAverage();
    var totalDiff = this.samples[1].total - this.samples[0].total;
    var idleDiff = this.samples[1].idle - this.samples[0].idle;
    callback(1 - idleDiff / totalDiff);
  }, avgTime);
}





var load = CPULoad(1000, (load) => {
     console.log('cpu_usage,cpu_usage='+(100*load).toFixed(1)+' '+Date.now()+'000000');
     //Just comment string below to make this endless loop:
     process.exit(0);
     }
);




