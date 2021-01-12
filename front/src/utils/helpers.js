const formatDate = date => {
  let d = new Date(date);
  let offset = d.getTimezoneOffset();
  d.setMinutes(d.getMinutes() + offset);
  return d.toLocaleDateString("en-CA", {
    month: "short",
    day: "numeric"
  });
}

export {
  formatDate
}
