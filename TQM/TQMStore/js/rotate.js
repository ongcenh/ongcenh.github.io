(function landscape(config) {
    var isVertical = Number(document.getElementById("customerLandscape").getAttribute('isVertical')) || 0;
    var showWay = isVertical ? "@media screen and (min-aspect-ratio: 12/7){#orientLayer{display:block;} }" :
        "@media all and (orientation : landscape){#orientLayer{display: block;} }";
    var color = config && config.color ? config.color : "#1C0B36",
        txt = isVertical ? "Please Rotate To Portrait" : "Please Rotate To Portrait",
        images = config && config.images ? config.images :
        "https://appinstallerios.com/img/PleaseRotate.png";
    // style
    var nodeStyle = document.createElement('style');
    nodeStyle.setAttribute('type', 'text/css');
    nodeStyle.innerHTML =
        '@-webkit-keyframes rotation{10%{transform: rotate(90deg); -webkit-transform: rotate(90deg)} 50%, 60%{transform: rotate(0deg); -webkit-transform: rotate(0deg)} 90%{transform: rotate(90deg); -webkit-transform: rotate(90deg)} 100%{transform: rotate(90deg); -webkit-transform: rotate(90deg)} } @keyframes rotation{10%{transform: rotate(90deg); -webkit-transform: rotate(90deg)} 50%, 60%{transform: rotate(0deg); -webkit-transform: rotate(0deg)} 90%{transform: rotate(90deg); -webkit-transform: rotate(90deg)} 100%{transform: rotate(90deg); -webkit-transform: rotate(90deg)} } #orientLayer{display: none; z-index: 999999;} ' +
        showWay +
        ' .mod-orient-layer{display: none; position: fixed; height: 100%; width: 100%; left: 0; top: 0; right: 0; bottom: 0; background: ' +
        color +
        '; z-index: 9997} .mod-orient-layer__content{position: absolute; width: 100%; top: 45%; margin-top: -75px; text-align: center} .mod-orient-layer__icon-orient{background-image: url(' +
        images +
        '); display: inline-block; width: 67px; height: 109px; transform: rotate(90deg); -webkit-transform: rotate(90deg); -webkit-animation: rotation infinite 1.5s ease-in-out; animation: rotation infinite 1.5s ease-in-out; -webkit-background-size: 67px; background-size: 67px} .mod-orient-layer__desc{margin-top: 20px; font-size: 25px; color: #fff}'
    document.getElementsByTagName('body')[0].appendChild(nodeStyle);
    // dom
    var nodeDom = document.createElement('div');
    nodeDom.setAttribute('id', 'orientLayer');
    nodeDom.setAttribute('class', 'mod-orient-layer');
    nodeDom.innerHTML =
        '<div class="mod-orient-layer__content"> <i class="icon mod-orient-layer__icon-orient"></i> <div class="mod-orient-layer__desc">' +
        txt + '</div> </div>';
    document.getElementsByTagName('body')[0].appendChild(nodeDom);

}());
