const calculatePrice = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    if (inputValue) {
      const addTaxDom = document.getElementById("add-tax-price");
      const fee = Math.floor(inputValue / 10);
      addTaxDom.innerHTML = fee;

      const profitDom = document.getElementById("profit");
      const profit = inputValue - fee;
      profitDom.innerHTML = profit;
    }
  })
};

window.addEventListener("turbo:load", calculatePrice);
window.addEventListener("turbo:render", calculatePrice);

