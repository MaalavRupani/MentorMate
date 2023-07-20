-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2023 at 02:45 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user-registeration`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `student_user` varchar(50) NOT NULL,
  `mentor_user` varchar(50) NOT NULL,
  `note` varchar(100) NOT NULL,
  `appointment_accepted` int(1) NOT NULL DEFAULT 0,
  `appointment_declined` int(1) NOT NULL DEFAULT 0,
  `appointment_status` int(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `student_user`, `mentor_user`, `note`, `appointment_accepted`, `appointment_declined`, `appointment_status`, `created_at`) VALUES
(1, 'DimaxoStudent', 'Dimaxo', 'Test to check if this shows on Dimaxo Mentor', 1, 0, 1, '2023-07-20 16:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `mentor_users`
--

CREATE TABLE `mentor_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `email` varchar(255) DEFAULT NULL,
  `authen_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mentor_users`
--

INSERT INTO `mentor_users` (`id`, `username`, `password`, `created_at`, `email`, `authen_code`) VALUES
(1, 'Dimaxo', '$2y$10$gb4Hnr4/J633AgUgqdkjguFxh0AFDJoB54J4i8LvpJpU14OrulsTy', '2023-07-20 16:15:24', 'dimaxo@gmail.com', 'DIM2002');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `questions` varchar(255) DEFAULT NULL,
  `questions_heading` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `answer` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `username`, `questions`, `questions_heading`, `created_at`, `answer`) VALUES
(1, 'DimaxoStudent', 'at night , me feel like insomniac and cant sleep , why is that?', 'Me wanna sleep, but i cant , why?', '2023-07-20 16:27:18', 'probably cuz u play games till late , try to put devices away 1 hour before uw anna sleep.\r\nEDIT 1 : test'),
(2, 'DimaxoStudent', 'TEST 2 - dimaxo', 'Test 2', '2023-07-20 17:20:30', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL,
  `quiz_by` varchar(50) NOT NULL,
  `quiz_name` varchar(20) NOT NULL,
  `quiz_subject` varchar(20) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `quiz_by`, `quiz_name`, `quiz_subject`, `total_questions`, `created_at`) VALUES
(1, 'Dimaxo', 'DimaxoQuiz', 'Subject_Dimaxo', 3, '2023-07-20 16:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `quiz_name` varchar(250) NOT NULL,
  `quiz_subject` varchar(250) NOT NULL,
  `quiz_by` varchar(250) NOT NULL,
  `question_id` int(250) NOT NULL,
  `question` varchar(250) NOT NULL,
  `option_a` varchar(250) NOT NULL,
  `option_b` varchar(250) NOT NULL,
  `option_c` varchar(250) NOT NULL,
  `option_d` varchar(250) NOT NULL,
  `answer` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `quiz_id`, `quiz_name`, `quiz_subject`, `quiz_by`, `question_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `answer`) VALUES
(49, 1, 'DimaxoQuiz', 'Subject_Dimaxo', 'Dimaxo', 0, 'Question 1 ', 'A', 'B', 'C', 'D', 'option_a'),
(50, 1, 'DimaxoQuiz', 'Subject_Dimaxo', 'Dimaxo', 1, 'Question2', 'A', 'B', 'C', 'D', 'option_b'),
(51, 1, 'DimaxoQuiz', 'Subject_Dimaxo', 'Dimaxo', 2, 'Question3', 'A', 'B', 'C', 'D', 'option_c');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `quiz_name` varchar(250) NOT NULL,
  `quiz_subject` varchar(250) NOT NULL,
  `quiz_by` varchar(250) NOT NULL,
  `correct_answers` int(250) NOT NULL,
  `incorrect_answers` int(250) NOT NULL,
  `total_questions` int(250) NOT NULL,
  `student_username` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_results`
--

INSERT INTO `quiz_results` (`id`, `quiz_id`, `quiz_name`, `quiz_subject`, `quiz_by`, `correct_answers`, `incorrect_answers`, `total_questions`, `student_username`) VALUES
(27, 1, 'DimaxoQuiz', 'Subject_Dimaxo', 'Dimaxo', 2, 1, 3, 'DimaxoStudent');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_solved`
--

CREATE TABLE `quiz_solved` (
  `id` int(250) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `quiz_name` varchar(250) NOT NULL,
  `quiz_subject` varchar(250) NOT NULL,
  `quiz_by` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `solved` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_solved`
--

INSERT INTO `quiz_solved` (`id`, `quiz_id`, `quiz_name`, `quiz_subject`, `quiz_by`, `username`, `solved`) VALUES
(27, 1, 'DimaxoQuiz', 'Subject_Dimaxo', 'Dimaxo', 'DimaxoStudent', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_solve_quiz`
--

CREATE TABLE `student_solve_quiz` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `quiz_name` varchar(250) NOT NULL,
  `quiz_subject` varchar(250) NOT NULL,
  `quiz_by` varchar(250) NOT NULL,
  `question_id` int(250) NOT NULL,
  `question` varchar(250) NOT NULL,
  `answer` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_solve_quiz`
--

INSERT INTO `student_solve_quiz` (`id`, `quiz_id`, `quiz_name`, `quiz_subject`, `quiz_by`, `question_id`, `question`, `answer`, `username`) VALUES
(37, 1, 'DimaxoQuiz', 'Subject_Dimaxo', 'Dimaxo', 0, 'Question 1 ', 'option_a', 'DimaxoStudent'),
(38, 1, 'DimaxoQuiz', 'Subject_Dimaxo', 'Dimaxo', 1, 'Question2', 'option_b', 'DimaxoStudent'),
(39, 1, 'DimaxoQuiz', 'Subject_Dimaxo', 'Dimaxo', 2, 'Question3', 'option_d', 'DimaxoStudent');

-- --------------------------------------------------------

--
-- Table structure for table `student_users`
--

CREATE TABLE `student_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_users`
--

INSERT INTO `student_users` (`id`, `username`, `password`, `created_at`, `email`) VALUES
(17, 'DimaxoStudent', '$2y$10$lirDSwK43/qlNEB.wjim6eQxX.1Y8OVy0LIieQV.mLj/tvAOsOSxm', '2023-07-20 16:18:07', 'dimaxo@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `mentor_users`
--
ALTER TABLE `mentor_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test` (`quiz_id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quiz_solved`
--
ALTER TABLE `quiz_solved`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `student_solve_quiz`
--
ALTER TABLE `student_solve_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `student_users`
--
ALTER TABLE `student_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `username_2` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mentor_users`
--
ALTER TABLE `mentor_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `quiz_solved`
--
ALTER TABLE `quiz_solved`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `student_solve_quiz`
--
ALTER TABLE `student_solve_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `student_users`
--
ALTER TABLE `student_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `test` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD CONSTRAINT `quiz_results_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_solved`
--
ALTER TABLE `quiz_solved`
  ADD CONSTRAINT `quiz_solved_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_solve_quiz`
--
ALTER TABLE `student_solve_quiz`
  ADD CONSTRAINT `student_solve_quiz_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
