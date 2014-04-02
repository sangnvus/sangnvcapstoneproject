<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Untitled</title>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
	setInterval("my_function();", 5000);
	function my_function() {
		$('#refresh').load(location.href + ' #time');
	}
</script>

</head>

<body>

	<div id="refresh">

		<table width="236" cellspacing="0" cellpadding="0" align="center">

			<tr>
				<td height="8"></td>
			</tr>
			<tr>
				<td class="nsg">Feriado de 29 de março</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td class="nsc">Não esqueçam do feriado, não estaremos
					atendendo neste dia.</td>
			</tr>
			<tr>
				<td height="8"></td>
			</tr>
			<tr>
				<td height="1" bgcolor="#E0E0E0"></td>
			</tr>
			<tr>
				<td height="8"></td>
			</tr>

		</table>

	</div>

	<div id="time"></div>

</body>
</html>