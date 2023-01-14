// 사이즈 클릭했을 때, dropdown menu가 나온다.
window.addEventListener("load", () => {
    var dropBtn = document.getElementsByClassName('dropbtn')[0];
    dropBtn.onclick = function() {
        var myDropdown = document.getElementById("myDropdown");
        myDropdown.classList.toggle('show');
    }
});

// 사이즈를 선택(클릭)하면, '사이즈'박스에 클릭한 사이즈(s,m,l) 표시해준다.
window.addEventListener("load", () => {
    var dropBtn = document.getElementsByClassName('dropbtn')[0];
    var pro01 = document.getElementById('pro01');
    var pro02 = document.getElementById('pro02');
    var pro03 = document.getElementById('pro03');
    var pro04 = document.getElementById('pro04');
    pro01.onclick = () => {
        dropBtn.textContent = pro01.textContent;
    }
    pro02.onclick = () => {
        dropBtn.textContent = pro02.textContent;
    }
    pro03.onclick = () => { 
        dropBtn.textContent = pro03.textContent;
    }
    pro04.onclick = () => { 
        dropBtn.textContent = pro04.textContent;
    }
}); 

// 아무곳이나 클릭하면, dropdown menu가 숨겨진다.
window.addEventListener("load", ()=>{
    var body = document.getElementsByTagName('body')[0];
    body.onclick = function(event) {
        if(!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName('dropdown-content');
            for(var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if(openDropdown.classList.contains('show')) {   
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
});
