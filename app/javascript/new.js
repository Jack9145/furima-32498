function calculation() {
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price") 
  const getProfit = document.getElementById("profit")
  itemPrice.addEventListener("keyup", (e) => {
  const priceNow = itemPrice.value
  const taxPrice = priceNow * 0.1 
  const fixedTaxPrice = Math.floor(taxPrice)
  addTaxPrice.innerHTML = fixedTaxPrice
  const profit = priceNow - fixedTaxPrice
  getProfit.innerHTML = profit})
};
window.addEventListener("load", calculation);






