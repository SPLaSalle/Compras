
function envia() {
    var clientContext = SP.ClientContext.get_current();
    var oList = clientContext.get_web().get_lists().getByTitle('Compras');

    var itemCreateInfo = new SP.ListItemCreationInformation();
    this.oListItem = oList.addItem(itemCreateInfo);
    oListItem.set_item('Title', document.getElementById('title').value);
    oListItem.set_item('RoutingRuleDescription', document.getElementById('desc').value);
    oListItem.update();

    clientContext.load(oListItem);
    clientContext.executeQueryAsync(
        Function.createDelegate(this, this.onQuerySucceeded3),
        Function.createDelegate(this, this.onQueryFailed3)
    );
}

function onQuerySucceeded3() {
    console.log('Item created: ' + oListItem.get_id());
}

function onQueryFailed3(sender, args) {
    console.log('Request failed. ' + args.get_message() +
        '\n' + args.get_stackTrace());
}