var list = document.getElementById('demo');

function changeText2() {
    var firstname = document.getElementById('firstname').value;
    document.getElementById('boldStuff2').innerHTML =
        '<ol><li>jeje</li><li>so fan</li></ol>';
    var entry = document.createElement('li');
    entry.appendChild(document.createTextNode(firstname));
    list.innerHTML = '<li>LOL</li><li>QQ!</li>';
}