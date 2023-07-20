<?php

    require_once "config.php";

    session_start();

    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: login.php");
        exit;
    }

    //$quiz_id = $_GET['quiz_id'];
    if ( (isset($_GET['quiz_subject'])) && (isset($_GET['quiz_name'])) && (isset($_GET['total'])) && (isset($_GET['quiz_id'])) && (isset($_GET['quiz_by'])) )
    {   
        $quiz_subject = $_GET['quiz_subject'];
        $quiz_name = $_GET['quiz_name'];
        $total_questions = $_GET['total'];
        $quiz_id = $_GET['quiz_id'];
        $quiz_by = $_GET['quiz_by'];
    }

    //$quiz_subject = $_GET['quiz_subject'];

    //$quiz_name = $_GET['quiz_name'];

    //$sql1 = "DELETE FROM `questions` WHERE CURRENT_DATE >= created_at + 7";            
    //mysqli_query($link, $sql1);
    $sql = "SELECT * FROM quiz_questions WHERE quiz_subject = '$quiz_subject' AND quiz_name = '$quiz_name' AND quiz_id = $quiz_id ORDER BY (question_id) ";
    echo '<form action="solve_quiz_action.php" method="post">';
    echo '<input type="text" hidden name="quiz_name" value="'.$quiz_name.'">';
    echo '<input type="text" hidden name="quiz_subject" value="'.$quiz_subject.'">';
    echo '<input type="text" hidden name="total_questions" value="'.$total_questions.'">';
    echo '<input type="text" hidden name="quiz_id" value="'.$quiz_id.'">';
    echo '<input type="text" hidden name="quiz_by" value="'.$quiz_by.'">';
    echo '<input type="text" hidden name="username" value="'.$_SESSION['username'].'">';
    $result = mysqli_query($link, $sql);
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_array($result)) {
            echo '
                <div class="form-group"> 
                <input type="text" hidden name="question_'.$row['question_id'].'" value="'.$row['question'].'" />
                <ul>
                <li>
                '.$row['question_id'].' - '.$row['question'].'
                </li>
                <li>
                Option A:
                <input type="radio" name="option_'.$row['question_id'].'" value="option_a" />'.$row['option_a'].'
                </li>
                <li>
                Option B:
                <input type="radio" name="option_'.$row['question_id'].'" value="option_b" />'.$row['option_b'].'
                </li>
                <li>
                Option C:
                <input type="radio" name="option_'.$row['question_id'].'" value="option_c" />'.$row['option_c'].'
                </li>
                <li>
                Option D:
                <input type="radio" name="option_'.$row['question_id'].'" value="option_d" />'.$row['option_d'].'
                </li>
                </ul>
                </div>'
            ;

        }
    }
    echo '<input type="submit" value="Submit"><br><br>';
    echo '</form>';
?>