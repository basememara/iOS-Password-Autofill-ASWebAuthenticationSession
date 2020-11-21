<?php
     header('Location: redirect.html?token=123&code=abc&callback_url_scheme=' . $_GET['redirect']);
     exit();
?>