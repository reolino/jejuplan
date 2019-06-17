<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery SelectListActions Plugin Demos</title>
  <meta name="description" content="Select List Actions - jQuery Plugin">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
  <script src="/lib/jquery-1.12.4.min.js"></script>
  <script src=/lib/bootstrap.min.js"></script>
  <script src="/lib/jquery.selectlistactions.js"></script>
  
  <link rel="stylesheet" href="/lib/bootstrap.min.css">
  <link rel="stylesheet" href="/lib/site.css">

</head>

<body>
	<div class="container">
	<h1>jQuery SelectListActions Plugin Demos</h1>
		
		<div class="row style-select">
			<div class="col-md-12">
				<div class="subject-info-box-1">
					<label>Available Superheroes</label>
					<select multiple class="form-control" id="lstBox1">
						<option value="123">Superman</option>
						<option value="456">Batman</option>
						<option value="789">Spiderman</option>
						<option value="654">Captain America</option>
					</select>
				</div>

				<div class="subject-info-arrows text-center">
					<br /><br />
					<input type='button' id='btnAllRight' value=">>" class="btn btn-default" /><br />
					<input type='button' id='btnRight' value=">" class="btn btn-default" /><br />
					<input type='button' id='btnLeft' value="<" class="btn btn-default" /><br />
					<input type='button' id='btnAllLeft' value="<<" class="btn btn-default" />
				</div>

				<div class="subject-info-box-2">
					<label>Superheroes You Have Selected</label>
					<select multiple class="form-control" id="lstBox2">
						<option value="765">Nick Fury</option>
						<option value="698">The Hulk</option>
						<option value="856">Iron Man</option>
					</select>
				</div>
				
				<div class="subject-info-arrows text-center">
					<br /><br />
					<input type='button' id='btnAllRight' value=">>" class="btn btn-default" /><br />
					<input type='button' id='btnRight' value=">" class="btn btn-default" /><br />
					<input type='button' id='btnLeft' value="<" class="btn btn-default" /><br />
					<input type='button' id='btnAllLeft' value="<<" class="btn btn-default" />
				</div>
				
				<div class="subject-info-box-3">
					<label>Superheroes You Have Selected</label>
					<select multiple class="form-control" id="lstBox3">
						<option value="765">Nick Fury</option>
						<option value="698">The Hulk</option>
						<option value="856">Iron Man</option>
					</select>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<script>
        $('#btnAvenger').click(function (e) {
            $('select').moveToList('#StaffList', '#PresenterList');
            e.preventDefault();
        });

        $('#btnRemoveAvenger').click(function (e) {
            $('select').removeSelected('#PresenterList');
            e.preventDefault();
        });

        $('#btnAvengerUp').click(function (e) {
            $('select').moveUpDown('#PresenterList', true, false);
            e.preventDefault();
        });

        $('#btnAvengerDown').click(function (e) {
            $('select').moveUpDown('#PresenterList', false, true);
            e.preventDefault();
        });

        $('#btnShield').click(function (e) {
            $('select').moveToList('#StaffList', '#ContactList');
            e.preventDefault();
        });

        $('#btnRemoveShield').click(function (e) {
            $('select').removeSelected('#ContactList');
            e.preventDefault();
        });

        $('#btnShieldUp').click(function (e) {
            $('select').moveUpDown('#ContactList', true, false);
            e.preventDefault();
        });

        $('#btnShieldDown').click(function (e) {
            $('select').moveUpDown('#ContactList', false, true);
            e.preventDefault();
        });

        $('#btnJusticeLeague').click(function (e) {
            $('select').moveToList('#StaffList', '#FacilitatorList');
            e.preventDefault();
        });

        $('#btnRemoveJusticeLeague').click(function (e) {
            $('select').removeSelected('#FacilitatorList');
            e.preventDefault();
        });

        $('#btnJusticeLeagueUp').click(function (e) {
            $('select').moveUpDown('#FacilitatorList', true, false);
            e.preventDefault();
        });

        $('#btnJusticeLeagueDown').click(function (e) {
            $('select').moveUpDown('#FacilitatorList', false, true);
            e.preventDefault();
        });
		
        $('#btnRight').click(function (e) {
            $('select').moveToListAndDelete('#lstBox1', '#lstBox2');
            e.preventDefault();
        });

        $('#btnAllRight').click(function (e) {
            $('select').moveAllToListAndDelete('#lstBox1', '#lstBox2');
            e.preventDefault();
        });

        $('#btnLeft').click(function (e) {
            $('select').moveToListAndDelete('#lstBox2', '#lstBox1');
            e.preventDefault();
        });

        $('#btnAllLeft').click(function (e) {
            $('select').moveAllToListAndDelete('#lstBox2', '#lstBox1');
            e.preventDefault();
        });
    </script>
</body>
</html>