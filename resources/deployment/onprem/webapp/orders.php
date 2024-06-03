<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        h2 {
            color: #555;
            text-align: center;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <h1>Order Details</h1>

    <?php
        $host = '127.0.0.1';
        $port = '5432';
        $dbname = 'northwind';
        $user = 'demouser';
        $password = 'demopass123';

        $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;user=$user;password=$password";

        try {
            $pdo = new PDO($dsn);

            if ($pdo) {
                // Fetch and display the server name
                $serverInfo = $pdo->query("SELECT inet_server_addr() AS server_name")->fetch(PDO::FETCH_ASSOC);
                echo "<h2>Connected to Database Server: " . htmlspecialchars($serverInfo['server_name']) . "</h2>";

                // Fetch and display order details
                $stmt = $pdo->query('SELECT * FROM order_details');
                echo "<table>";
                echo "<tr><th>Order ID</th><th>Product ID</th><th>Unit Price</th><th>Quantity</th><th>Discount</th></tr>";
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($row['order_id']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['product_id']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['unit_price']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['quantity']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['discount']) . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
            }
        } catch (PDOException $e) {
            echo "<p style='color: red; text-align: center;'>Error: " . $e->getMessage() . "</p>";
        }
    ?>
</body>
</html>
