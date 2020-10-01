function price() {
  const item_price = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  item_price.addEventListener("input", (e) => {
    
    const value = item_price.value
    if(value >= 300 && value <= 9999999){
      let fee = value * 0.1
      let gain = value - fee;
      add_tax.innerHTML = fee;
      profit.innerHTML = gain;
    } else {
      let fee = '0';
      let gain = '0';
      add_tax.innerHTML = fee;
      profit.innerHTML = gain;
    }
  });
}
window.addEventListener("load", price);