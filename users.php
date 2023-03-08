<?php
  $connect = mysqli_connect('localhost', 'root', '', '3a_motel');
  $sql = "SELECT nr_pracownika, imie, nazwisko, pesel, login FROM pracownicy ORDER BY nazwisko";
  $result = mysqli_query($connect, $sql);
?>  

<!DOCTYPE html>
<html lang="pl">
<head>
  <title>HOTEL CALIFORNIA</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<?php require('menu.php');?>

<div class="container-fluid mt-3">
  <h3>Użytkownicy</h3>

  <form><button submit=

  <table class="table">
    <thead class="table-dark">
      <tr>
        <th>Nr prac.</th>
        <th>Nazwisko</th>
        <th>Imię</th>
        <th>Pesel</th>
        <th>Login</th>
        <th></th>
      </tr>
    </thead>
    <tbody>

    <?php
    while ($row = mysqli_fetch_array($result)) {
      echo "<tr><td>{$row['nr_pracownika']}</td>
                <td>{$row['nazwisko']}</td>
                <td>{$row['imie']}</td>
                <td>{$row['pesel']}</td>
                <td>{$row['login']}</td><td></td></tr>\n";
    }?>
    </tbody>
  </table>


</div>

</body>
</html>
