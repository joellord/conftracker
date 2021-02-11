
class Logger {
  LEVEL = {
    INFO: "INFO",
    ERROR: "ERROR",
    DEBUG: "DEBUG",
    LOG: "LOG"
  }

  COLOR = {
    INFO: "\u001b[34m",
    ERROR: "\u001b[31m",
    DEBUG: "\u001b[32m",
    LOG: "\u001b[33m",
    RESET: "\u001b[39m"
  }

  showInfo = true;
  showError = true;
  showDebug = false;

  constructor(options = {}) {
    if (options.debug) this.showDebug = true;
    this.log("Logger initialized", this.LEVEL.INFO);
  }

  log(text, level = this.LEVEL.LOG) {
    let logging = console.log;
    if (level === this.LEVEL.INFO) logging = console.info;
    if (level === this.LEVEL.DEBUG) logging = console.debug;
    if (level === this.LEVEL.ERROR) logging = console.error;

    let d = new Date();
    let formattedDate = `${d.getFullYear().toString()}-${(d.getMonth() + 1).toString().padStart(2, "0")}-${d.getDate().toString()}`;
    formattedDate += " - ";
    formattedDate += `${d.getHours().toString().padStart(2, "0")}:${d.getMinutes().toString().padStart(2, "0")}:${d.getSeconds().toString().padStart(2, "0")}`;

    let color = this.COLOR[level];
    
    text = `${color}[${level}][${formattedDate}]${this.COLOR.RESET} -- ${text}`;

    logging(text);
  }

  info(text) {
    this.log(text, this.LEVEL.INFO);
  }

  error(text) {
    this.log(text, this.LEVEL.ERROR);
  }

  debug(text) {
    this.log(text, this.LEVEL.DEBUG);
  }
}

module.exports = Logger;