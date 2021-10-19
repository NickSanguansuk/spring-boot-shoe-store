
// ---------- ---------- ---------- ---------- ----------
// For search/detail page

let mainImage = document.getElementById('my-detail-main-image');
let smallImages = document.getElementsByClassName('my-small-image');

for (let i = 0; i < smallImages.length; i++) {
    smallImages[i].onclick = function () {
        mainImage.src = smallImages[i].src;
    }
}

// ---------- ---------- ---------- ---------- ----------








