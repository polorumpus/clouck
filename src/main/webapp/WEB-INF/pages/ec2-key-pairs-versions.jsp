<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<meta name="decorator" content="main-theme" />
<meta name="serviceMenu" content="ec2"/>
<meta name="resourceMenu" content="keyPairs"/>
<title>Key Pairs History</title>
<style type="text/css">
.dataTables_wrapper .row-fluid:first-child {
    display: none;
}
</style>
</head>
<body>
<div class="row-fluid">
    <div class="span3">
        <div class="id-filter">Region:</div>
        <select id="region" class="span9">
        <c:forEach var="region" items="${regions}">
            <option value="${region.regions.name}">${region.desc}</option>
        </c:forEach>
        </select>
    </div>
    <div class="span3">
        <div class="id-filter">Key Pair Name:</div>
        <input id="uniqueId" type="text"class="input-medium"/>
    </div>
    <div class="span3">
        <div class="id-filter">Ending:</div>
        <div id="datetimepicker" class="input-append date">
            <input id="endingDateTime" class="input-medium" data-format="yyyy-MM-dd hh:mm:ss" type="text"></input>
            <span class="add-on"> <i data-time-icon="icon-time" data-date-icon="icon-calendar"> </i></span>
        </div>
    </div>
    <div class="span2" style="display: inline;">
        <button id ="filter" class="btn btn-primary" type="button" onclick="javascript:filterVersions('${currentAccount.id}', 'instances')">Filter</button>
        <button class="btn btn-primary" type="button" onclick="javascript:clearFilter('${currentAccount.id}', 'instances')">Clear</button>
    </div>
</div>

<div class="row-fluid">
	<table id="keyPairVersionsTable" class="table table-striped table-hover">
		<thead>
			<tr>
                <th width="5%">Region</th>
				<th width="20%">Time Detected</th>
                <th width="78%">Operations</th>
                <th width="5%"></th>
			</tr>
		</thead>
	</table>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $(document).keypress(function(e) {
        if(e.which == 13) {
            $('#filter').click();
        }
    });
    $('#datetimepicker').datetimepicker();
    oTable = $('#keyPairVersionsTable').dataTable({
        "bServerSide": true,
        "bProcessing": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": false,
        "sAjaxSource": "/rest/dataTable/accounts/${currentAccount.id}/ec2/versions/keyPairs"
    });
});
</script>
</body>
</html>
