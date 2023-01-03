const cartCount = document.getElementById("cartCount");
const cartList = document.getElementById("cart-list");
const totalPrice = document.getElementById("total-price");
const checkout=document.getElementById("checkout");

//cart from localstorage
let cart_count = JSON.parse(localStorage.getItem("cart"));

//checkout action
function checkoutFunction(){
	if(cart_count.products.length==0){
		return;
	}
	cleanProducts();
	window.location.pathname="/ecommerce/checkout.jsp";
}

window.onload = function() {
	showCartCount();
	showCart();
}
//show cart count
function showCartCount() {
	let count = 0;
	if (cart_count != null) {
		let products = cart_count.products;
		for (let i = 0; i < products.length; i++) {
			count += products[i].quantity;
		}
		cartCount.innerText = count;
	}
}

//Show Cart
function showCart() {

	let products = cart_count.products;

	let ul = createTags("ul", ["list-group"], "");
	products.forEach((p) => {
		let li = createTags("li", ["list-group-item", "d-flex", "justify-content-between", "align-items-center"], "");
		let h3_name = createTags("h3", [], p.name);
		let p_price = createTags("p", [], "Price : " + p.totalPrice + "/TK");
		let p_quantity = createTags("p", [], "Quantity : " + p.quantity);
		let removeBtn = createTags("button", ["btn", "btn-danger"], "Delete");
		let addBtn = createTags("button", ["btn", "btn-primary"], "+");
		let delBtn = createTags("button", ["btn", "btn-danger"], "-");
		let quantity_section = createTags("div", [], "");


		//Actions
		removeBtn.onclick = removeProductAction;

		function removeProductAction() {
			let id = p.pid;
			let newList = [];
			for (let i = 0; i < products.length; i++) {
				if (products[i].pid == id) continue;
				newList.push(products[i]);
			}
			cart_count.products = newList;
			localStorage.setItem("cart", JSON.stringify(cart_count));
			refreshCartList();
			showCart();
			showCartCount();
		}

		addBtn.onclick = function() {
			let id = p.pid;
			let product = products.find(p => p.pid == id);
			product.quantity += 1;
			localStorage.setItem("cart", JSON.stringify(cart_count));
			showCartCount();
		}

		delBtn.onclick = function() {
			let id = p.pid;
			let product = products.find(p => p.pid == id);
			product.quantity -= 1;
			if (product.quantity <= 0) {
				removeProductAction();
				return;
			}
			localStorage.setItem("cart", JSON.stringify(cart_count));
			showCartCount();
		}

		//Appen section
		//quantity
		quantity_section.append(addBtn);
		quantity_section.append(delBtn);
		p_quantity.append(quantity_section);

		//list - li
		li.append(h3_name);
		li.append(p_price);
		li.append(p_quantity);
		li.append(removeBtn);
		//list - ul
		ul.append(li);
	})

	cartList.append(ul);
	totalPrice.innerText = "In Total : " + getTotalPrice() + "/TK";
}
//Handle Cart - runs on click
const addToCart = function(uid, pid, name, totalPrice) {
	let cart = localStorage.getItem("cart");//object
	if (cart == null) {
		let products = [];
		let product = {
			pid,
			name,
			totalPrice,
			quantity: 1
		};
		products.push(product);
		let newCart = {
			user: uid,
			products
		};
		localStorage.setItem("cart", JSON.stringify(newCart));
	} else {
		let oldCart = JSON.parse(cart);
		let oldProducts = oldCart.products;
		let oldProduct = oldProducts.find((p) => p.pid == pid);
		if (oldProduct == null) {
			let product = {
				pid,
				name,
				totalPrice,
				quantity: 1
			};
			oldProducts.push(product);
		} else {
			oldProduct.quantity += 1;
		}

		localStorage.setItem("cart", JSON.stringify(oldCart));
	}
	showCartCount();
}
//calculate totalPrice
function getTotalPrice() {
	let price = 0;
	if (cart_count != null) {
		let products=cart_count.products;
		products.forEach((p) => {
			price += (p.totalPrice * p.quantity);
		})
	}

	return price;
}

//create element function
function createTags(tagName, classArr, text) {
	let tag = document.createElement(tagName);
	classArr.forEach((v) => {
		tag.classList.add(v);
	});
	tag.innerText = text;

	return tag;
}

//refresh cart list

function refreshCartList(){
	cartList.innerHTML="";
}

function cleanProducts(){
	cart_count.products=[];
	localStorage.setItem("cart",JSON.stringify(cart_count));
}
