
window.addEventListener('DOMContentLoaded', () => {
  const  priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = inputValue / 10;
    addTaxDom.innerHTML = fee;

    const profitDom = document.getElementById("profit");
    const profit = inputValue - fee;
    profitDom.innerHTML = profit;
  })
});