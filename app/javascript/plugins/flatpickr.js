import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    enable: [
      {
        from: "today",
        to: new Date().fp_incr(180)
      }]
  });
}

export { initFlatpickr };
