let ContenedorCarrito = document.querySelector('.cards'); // Cambia la selección a '.cards'
let containerBuyCart = document.querySelector('.card-items');
let priceTotal = document.querySelector('.price-total');
let amountProduct = document.querySelector('.count-product');
 
let buyThings = [];
let totalCard = 0;
let countProduct = 0;
 
loadEventListeners();
 
function loadEventListeners() {
  ContenedorCarrito.addEventListener('click', addProduct);
  containerBuyCart.addEventListener('click', deleteProduct);
}
 
function addProduct(e) {
  e.preventDefault();
  if (e.target.classList.contains('btn-add-cart')) {
    const selectProduct = e.target.closest('.card_content'); // Busca el elemento card_content más cercano
    readTheContent(selectProduct);
  }
}
 
function deleteProduct(e) {
  if (e.target.classList.contains('delete-product')) {
    const deleteId = e.target.getAttribute('data-id');
 
    buyThings.forEach((value) => {
      if (value.id == deleteId) {
        let priceReduce = parseFloat(value.price) * parseFloat(value.amount);
        totalCard = totalCard - priceReduce;
        totalCard = totalCard.toFixed(2);
      }
    });
    buyThings = buyThings.filter((product) => product.id !== deleteId);
    countProduct--;
 
    if (buyThings.length === 0) {
      priceTotal.innerHTML = 0;
      amountProduct.innerHTML = 0;
    }
    loadHtml();
  }
}
 
function readTheContent(product) {
  const infoProduct = {
    image: product.parentElement.querySelector('.card_image img').src, // Ajusta el selector para la imagen
    title: product.querySelector('.card_title').textContent,
    price: product.querySelector('.btn-add-cart').getAttribute('data-price'), // Agrega el atributo data-price
    id: product.querySelector('.btn-add-cart').getAttribute('data-id'),
    amount: 1,
  };
 
  totalCard = parseFloat(totalCard) + parseFloat(infoProduct.price);
  totalCard = totalCard.toFixed(2);
 
  const exist = buyThings.some((product) => product.id === infoProduct.id);
  if (exist) {
    const pro = buyThings.map((product) => {
      if (product.id === infoProduct.id) {
        product.amount++;
        return product;
      } else {
        return product;
      }
    });
    buyThings = [...pro];
  } else {
    buyThings = [...buyThings, infoProduct];
    countProduct++;
  }
  loadHtml();
}
 
function loadHtml() {
  clearHtml();
  buyThings.forEach((product) => {
    const { image, title, price, amount, id } = product;
    const row = document.createElement('div');
    row.classList.add('item');
    row.innerHTML = `
      <img src="${image}" alt="">
      <div class="item-content">
          <h5>${title}</h5>
          <h5 class="cart-price">$${price}</h5>
          <h6>Amount: ${amount}</h6>
      </div>
      <span class="delete-product" data-id="${id}">X</span>
    `;
 
    containerBuyCart.appendChild(row);
 
    priceTotal.innerHTML = totalCard;
    amountProduct.innerHTML = countProduct;
  });
}
 
function clearHtml() {
  containerBuyCart.innerHTML = '';
}