var id;
$(function () {
    //console.log(window.innerHeight);
    $("#list").css('height', window.innerHeight - 356);
    $("#info").css('height', window.innerHeight - 356);
    document.getElementById('wrapper').style.height = (window.innerHeight - 200);
    ko.applyBindings(new defaultViewModel());
});
function defaultViewModel() {
    var self = this;
    self.compras = ko.observableArray();
    self.info = ko.observableArray();

    self._loadList = function () {
        var clientContext = SP.ClientContext.get_current();

        // This line accesses the homework library in the local app web.
        var list = clientContext.get_web().get_lists().getByTitle('Compras');

        // These lines are used to access the homework library in the host web instead of the app web
        //     var hostWebContext = new SP.AppContextSite(clientContext, CO.Configs.SPHostUrl);
        //     var list = hostWebContext.get_web().get_lists().getByTitle('Homework');

        var query = new SP.CamlQuery();
        query.set_viewXml();

        self._pendingItems = list.getItems(query);
        clientContext.load(self._pendingItems);

        clientContext.executeQueryAsync(
            Function.createDelegate(self, self._onLoadListSucceeded),
            Function.createDelegate(self, self._onLoadListFailed)
            );
    }

    self._onLoadListSucceeded = function (sender, args) {

        var listEnumerator = self._pendingItems.getEnumerator();
        while (listEnumerator.moveNext()) {
            var item = listEnumerator.get_current().get_fieldValues();
            self.compras.push(
                {
                    title: item.Title,
                    date: item.Modified.toString(),
                    author: item.Author.get_lookupValue(),
                    id: item.ID,
                    description: item.RoutingRuleDescription
                });
        }

        document.getElementById("list_show").style.display = "block";
        document.getElementById("spinner_list").style.display = "none";
        

    }

    self._onLoadListSucceeded2 = function (sender, args) {

        self.info.removeAll();

        var listEnumerator = self._pendingItems2.getEnumerator();
        //console.log(listEnumerator.$2F_0);
        while (listEnumerator.moveNext()) {
            var item = listEnumerator.get_current().get_fieldValues();
            //console.log(item);
            self.info.push(
                {
                    title: item.Title,
                    content: item.Content1,
                    type: item.Type,
                    date: item.Modified.toString(),
                    author: item.Author.get_lookupValue(),
                    id: item.ID,
                    idCompra: item.ID_x005f_compra
                });
        }

        if (listEnumerator.$2F_0 == 0) {
            self.info.push(
                {
                    title: 'none',
                    content: 'none',
                    type: 'none',
                    date: 'none',
                    author: 'none',
                    id: 0,
                    idCompra: 0
                });
        }

        document.getElementById("table_actions").style.display = "block";
        document.getElementById("spinner_actions").style.display = "none";


        $('#button1').attr('disabled', 'disabled');
        $('#button1').prop('disabled', false);
        $('#button2').attr('disabled', 'disabled');
        $('#button2').prop('disabled', false);

    }

    self.updateinfo = function () {
        
        console.log('updateinfo');

        document.getElementById("table_actions").style.display = "none";
        document.getElementById("spinner_actions").style.display = "block";

        var clientContext = SP.ClientContext.get_current();
        //console.log("- - - - - L O A D I N G - - - - -");
        //console.log("Compra_id: " + compra_id);

        // This line accesses the homework library in the local app web.
        var list2 = clientContext.get_web().get_lists().getByTitle('Actions');

        // These lines are used to access the homework library in the host web instead of the app web
        //     var hostWebContext = new SP.AppContextSite(clientContext, CO.Configs.SPHostUrl);
        //     var list = hostWebContext.get_web().get_lists().getByTitle('Homework');

        var query2 = new SP.CamlQuery();
        query2.set_viewXml("<View>"
                        + "  <Query>"
                        + "  <Where>"
                        + "    <Eq>"
                        + "       <FieldRef Name='ID_x005f_compra' />"
                        + "       <Value Type='Number'>" + id + "</Value>"
                        + "    </Eq>"
                        + "  </Where>"
                        + "  </Query>"
                        + "  <RowLimit>100</RowLimit>"
                        + "</View>");
        self._pendingItems2 = list2.getItems(query2);
        clientContext.load(self._pendingItems2);

        clientContext.executeQueryAsync(
            Function.createDelegate(self, self._onLoadListSucceeded2),
            Function.createDelegate(self, self._onLoadListFailed)
            );

    }

    self.showinfo = function (compra) {

        document.getElementById("table_actions").style.display = "none";
        document.getElementById("spinner_actions").style.display = "block";

        document.getElementById('table_info_desc').innerHTML = self.compras()[compra.id - 1].description;
        document.getElementById('table_info_id').innerHTML = self.compras()[compra.id - 1].id;
        document.getElementById('table_info_title').innerHTML = self.compras()[compra.id - 1].title;
        document.getElementById('table_info_date').innerHTML = self.compras()[compra.id - 1].date;
        document.getElementById('table_info_author').innerHTML = self.compras()[compra.id - 1].author;
        // Start load?
        // Get info
        var clientContext = SP.ClientContext.get_current();
        var compra_id = self.compras()[compra.id - 1].id;
        id = compra_id;
        //console.log("- - - - - L O A D I N G - - - - -");
        //console.log("Compra_id: " + compra_id);

        // This line accesses the homework library in the local app web.
        var list2 = clientContext.get_web().get_lists().getByTitle('Actions');

        // These lines are used to access the homework library in the host web instead of the app web
        //     var hostWebContext = new SP.AppContextSite(clientContext, CO.Configs.SPHostUrl);
        //     var list = hostWebContext.get_web().get_lists().getByTitle('Homework');

        var query2 = new SP.CamlQuery();
        query2.set_viewXml("<View>"
                        + "  <Query>"
                        + "  <Where>"
                        + "    <Eq>"
                        + "       <FieldRef Name='ID_x005f_compra' />"
                        + "       <Value Type='Number'>" + compra_id + "</Value>"
                        + "    </Eq>"
                        + "  </Where>"
                        + "  </Query>"
                        + "  <RowLimit>100</RowLimit>"
                        + "</View>");
        self._pendingItems2 = list2.getItems(query2);
        clientContext.load(self._pendingItems2);

        clientContext.executeQueryAsync(
            Function.createDelegate(self, self._onLoadListSucceeded2),
            Function.createDelegate(self, self._onLoadListFailed)
            );
        // End load?
    }

    self._onLoadListFailed = function (sender, args) {
        alert('Unable to load file list: ' + args.get_message() + '\n' + args.get_stackTrace());
    }

    self._loadList();
}

function accio() {
    createAction();
}

function comment() {
    var comment = $('#modal_comment').val();
    //console.log(comment);

    createComment(comment);

    //$('#exampleModal').modal('hide');
   // $('#modal_comment').val('');
}

function createComment(comment) {
    var clientContext = SP.ClientContext.get_current();
    var oList = clientContext.get_web().get_lists().getByTitle('Actions');

    var itemCreateInfo = new SP.ListItemCreationInformation();
    this.oListItem = oList.addItem(itemCreateInfo);
    oListItem.set_item('Title', 'Comment');
    oListItem.set_item('Type', 'Comment');
    oListItem.set_item('ID_x005f_compra', id);
    oListItem.set_item('Content1', comment);
    oListItem.update();

    clientContext.load(oListItem);
    clientContext.executeQueryAsync(
        Function.createDelegate(this, this.onQuerySucceeded4),
        Function.createDelegate(this, this.onQueryFailed3)
    );
}

function onQuerySucceeded4() {
    console.log('Item created: ' + oListItem.get_id());

    $('#exampleModal').modal('hide');
    $('#modal_comment').val('');
}

function createAction() {
    var clientContext = SP.ClientContext.get_current();
    var oList = clientContext.get_web().get_lists().getByTitle('Actions');

    var itemCreateInfo = new SP.ListItemCreationInformation();
    this.oListItem = oList.addItem(itemCreateInfo);
    oListItem.set_item('Title', 'Action');
    oListItem.set_item('Type', 'Action');
    oListItem.set_item('ID_x005f_compra', id);
    oListItem.set_item('Content1', 'Acceptat?');
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