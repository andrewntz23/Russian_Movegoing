window.onload = function(){
    setBoxes();
}

function setBoxes(){
    var container = document.getElementById('boxes')
    var spans = document.querySelectorAll('span'); 
    var classes = []
    
    for (var i = 0; i < spans.length; i++){
        var thisClass = spans[i].getAttribute('class')
        if (classes.indexOf(thisClass) == -1){
           classes.push(thisClass)
           }
    }
    
    for (var i = 0; i < classes.length; i++){
        var newLabel = document.createElement("label");
        var newText = document.createTextNode(classes[i])
        newLabel.appendChild(newText);
        newLabel.setAttribute('for', classes[i])
        var newBox = document.createElement("input");
        newBox.type = "radio";
        newBox.id = classes[i]
        newBox.name = 'selector'
        newBox.setAttribute('onclick', 'highlight("'.concat(classes[i], '")'));
        container.appendChild(newLabel)
        container.appendChild(newBox)
    }
}

function highlight(highlightClass) {
    clearRight()
    var spans = document.getElementsByClassName(highlightClass);
    var rightPanel = document.getElementById('rightPanel');
    for (var i = 0; i < spans.length; i++){
        spans[i].setAttribute('style', 'color:red');
        spans[i].id = 'target'.concat(i);
        var newP = document.createElement('p');
        var newA = document.createElement('a');
        var pText = document.createTextNode(spans[i].innerText);
        newA.appendChild(pText);
        newA.href = '#target'.concat(i);
        newP.appendChild(newA);
        newP.appendChild(newA)
        rightPanel.appendChild(newP);
    }
}

function clearRight(){
     var rightDiv = document.getElementById('rightPanel');
     while (rightDiv.hasChildNodes()){
        rightDiv.removeChild(rightDiv.childNodes[0]);
     }
    
     var spans = document.querySelectorAll('span'); 
     for (var i = 0; i < spans.length; i++){
         spans[i].removeAttribute('id')
     }
}