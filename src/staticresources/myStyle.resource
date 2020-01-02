.custPopup{
    background-color: white;
    border-width: 2px;
    border-style: solid;
    z-index: 9999;
    left: 50%;
    padding:10px;
    position: absolute;
    width: 500px;
    margin-left: -250px;
    top:100px;
    font-size: 20px;
}
.popupBackground{
    background-color:black;
    opacity: 0.20;
    filter: alpha(opacity = 20);
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 9998;
}
.mainDiv{
    background-color: white;
    width: 100%;
    border: 5px;
    border-spacing: 0;
    border-radius: 5px;
    text-align: center;
}
tr:nth-child(even) {
    background-color: blue;
    padding: 5px;
    margin: 5px;
}
.table{
    display: table;
    width: 100%;
    background-color: white;
    border: 5px;
    border-radius: 10px;
}
.row{
    display: table-row;
}
.cell{
    border: 1px solid black;
    display: table-cell;
    padding: 5px;
}
.row:nth-child(even){
    background-color: blue;
}