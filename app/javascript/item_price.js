window.addEventListener("DOMContentLoaded", () => {

    const priceInput = document.getElementById("item-price");
    const PriceTax = document.getElementById("add-tax-price");
    const PriceProfit = document.getElementById("profit");

    if (priceInput != null) {
    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        PriceTax.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
        PriceProfit.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
    });
   } 
});