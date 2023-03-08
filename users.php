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

  <?php require('menu.php');
  if (isset($_REQUEST['typ'])) {
    $typ = $_REQUEST['typ'];
    switch ($typ) {
      case "n":?>
        <div class="container-fluid mt-3">
          <h3>NOWY UŻYTKOWNIK</h3>
          <form action="users.php" method="GET">
            <input type="hidden" name="typ" value="pn">
            <div class="mb-3 mt-3">
              <label for="imie" class="form-label">Imię:</label>
              <input type="text" class="form-control" id="imie" name="imie" maxlength="20" required>
            </div>
            <div class="mb-3 mt-3">
              <label for="nazwisko" class="form-label">Nazwisko:</label>
              <input type="text" class="form-control" id="nazwisko" name="nazwisko" maxlength="50" required>
            </div>
            <div class="mb-3 mt-3">
              <label for="pesel" class="form-label">Pesel:</label>
              <input type="text" class="form-control" id="pesel" name="pesel" maxlength="11" required>
            </div>
            <div class="mb-3 mt-3">
              <label for="login" class="form-label">Login:</label>
              <input type="text" class="form-control" id="login" name="login" maxlength="10" required>
            </div>
            <input type="hidden" name="haslo" value="<?php echo md5('test');?>">
            <input type="submit" value="Zatwierdź">
          </form>
        </div>
        <?php
        break;
      case "pn":
        
        break;
      case "e":
        echo "<h3>EDYCJA UŻYTKOWNIKA</h3>";
        break;
      case "pe":
        break;
      case "u":
        echo "<h3>USUWANIE UŻYTKOWNIKA</h3>";
        break;
      case "pu":
        break;  
    }
  } else {
  ?>
    <div class="container-fluid mt-3">
      <h3>Użytkownicy</h3>
      <div class="row">
        <form action="users.php" method="GET">
          <input type="hidden" name="typ" value="n">
          <input class="" type="submit" value="Nowy użytkownik">
        </form>
      </div>
      <div class="row">
        <table class="table">
          <thead class="table-dark">
            <tr>
              <th>Nr prac.</th>
              <th>Nazwisko</th>
              <th>Imię</th>
              <th>Pesel</th>
              <th>Login</th>
              <th colspan='3'>&nbsp;</th>
            </tr>
          </thead>
          <tbody>
          <?php
          while ($row = mysqli_fetch_array($result)) {
            echo "<tr><td>{$row['nr_pracownika']}</td>
                      <td>{$row['nazwisko']}</td>
                      <td>{$row['imie']}</td>
                      <td>{$row['pesel']}</td>
                      <td>{$row['login']}</td><td></td>\n";
            echo "    <td><form action='users.php' method='GET'>";
            echo "          <input type='hidden' name='typ' value='e'>";
            echo "          <input type='hidden' name='id' value='{$row['nr_pracownika']}'>";
            echo "          <input type='submit' value='Edytuj'>";
            echo "    </form></td>\n";
            echo "    <td><form action='users.php' method='GET'>";
            echo "          <input type='hidden' name='typ' value='u'>";
            echo "          <input type='hidden' name='id' value='{$row['nr_pracownika']}'>";
            echo "          <input type='submit' value='Usuń'>";
            echo "    </form></td></tr>\n";        
          }?>
          </tbody>
        </table>
      </div>
    </div>
  <?php
  }
  ?>
</body>
</html>
