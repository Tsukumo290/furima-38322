function price (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const fee = itemPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${Math.floor(fee)}`;
    const SalesProfit = itemPrice.value - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${Math.floor(SalesProfit)}`;
  });
}

window.addEventListener('load', price);