-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2023 at 08:24 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cornfield`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `corn_kg` varchar(255) NOT NULL,
  `corn_type` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `client_id`, `owner_id`, `name`, `contact_number`, `location`, `corn_kg`, `corn_type`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Gideon Fritsch', '09676651111', '9003 Dominique Port\nWest Eloiseton, NC 40317', '3', 'yellow', '1999-02-03', '1995-10-15', 'pending', '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(2, 2, 2, 'Prof. Leonardo Bradtke IV', '09676651111', '98200 Junior Radial\nWillowborough, CO 31598', '6', 'yellow', '2022-08-10', '2001-02-23', 'pending', '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(3, 2, 3, 'Manuela Hintz', '09676651111', '526 Frederick Estate\nNorth Jeremie, NC 02171', '3', 'yellow', '1975-09-13', '2008-02-23', 'pending', '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(5, 3, 4, 'Gerry Me', '9569264651', 'Macabalan', '12', 'White', '01/01/2023', '01/05/2023', 'done', '2023-01-12 04:14:06', '2023-01-12 05:40:36'),
(6, 3, 4, 'Gerry Me', '9569264651', 'Nazareth', '999', 'Yellow', '01/08/2023', '01/11/2023', 'pending', '2023-01-12 05:34:50', '2023-01-12 05:34:50'),
(10, NULL, 4, 'Nicholas Cage', '+639569264651', 'USA', '123', 'White', '01/15/2023', '01/18/2023', 'approved', '2023-01-12 06:15:41', '2023-01-12 06:15:41'),
(12, NULL, 4, 'Mike Wazowski', '+639569264651', 'California', '23', 'White', '01/30/2023', '01/31/2023', 'done', '2023-01-12 06:22:52', '2023-01-12 06:24:38'),
(13, 3, 4, 'Gerry Me', '+639569264651', 'Macabalan', '777', 'Yellow', '01/22/2023', '01/25/2023', 'approved', '2023-01-12 06:23:40', '2023-01-12 06:24:03'),
(14, NULL, 4, 'Roseanne Park', '9569264651', 'Macabalan', '1', 'Yellow', '01/19/2023', '01/21/2023', 'done', '2023-01-13 21:10:48', '2023-01-13 21:10:53'),
(15, NULL, 4, 'Roseanne Park', '9569264651', 'Macabalan', '1', 'Yellow', '01/19/2023', '01/21/2023', 'done', '2023-01-13 21:16:21', '2023-01-13 21:16:36'),
(16, 3, 4, 'Gerry Me', '9569264651', 'Macabalan', '2', 'White', '01/19/2023', '01/21/2023', 'done', '2023-01-13 21:17:38', '2023-01-13 21:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 4, '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(2, 5, '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(3, 6, '2023-01-12 04:10:03', '2023-01-12 04:10:03'),
(4, 8, '2023-01-17 04:55:00', '2023-01-17 04:55:00'),
(5, 9, '2023-01-17 04:57:26', '2023-01-17 04:57:26'),
(6, 10, '2023-01-17 05:16:25', '2023-01-17 05:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_10_30_084811_create_owners_table', 1),
(6, '2022_10_30_091341_create_clients_table', 1),
(7, '2022_10_30_092708_create_appointments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(2, 3, '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(3, 1, '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(4, 7, '2023-01-12 04:11:33', '2023-01-12 04:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_humi`
--

CREATE TABLE `tbl_humi` (
  `humi_id` int(10) UNSIGNED NOT NULL,
  `humi_value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `age`, `username`, `address`, `contact_number`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dora Kessler', 'admin@test.com', '18', 'Samanta', '7915 Keagan Coves Apt. 649\nPort Lupe, WV 98900-0844', '09676651111', NULL, '$2y$10$94MPwU.S8Jw1zVKShoJcyuHrtwyzunKG1lcVSEomn64dbaEWtEGBu', 'F4LY477FPu', '2023-01-12 04:06:36', '2023-01-12 04:06:36'),
(2, 'Dr. Trent Spinka', 'owner1@test.com', '18', 'Tyshawn', '6300 Kris Estate\nVonfurt, KY 81482', '09676651111', NULL, '$2y$10$OGvVjhtOm5tQ3rywRBo./.Ap/D1xmo2GaJVTPbTLdM5opM7Kj1/ee', 'xdBhVCqNQt', '2023-01-12 04:06:36', '2023-01-12 04:06:36'),
(3, 'Ms. Neva Hand', 'owner2@test.com', '18', 'Norberto', '236 Mann Common\nWilmerburgh, WI 47946', '09676651111', NULL, '$2y$10$OflB4BSQEjS4zgSM.EYdcubrML2fsZkizELlhyOmzqXI/CNNMx0.e', 'dA9f0B2fLB', '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(4, 'Alysson Kling', 'client1@test.com', '18', 'Benton', '6260 Lind Valley Apt. 863\nSimonishaven, VA 33148', '09676651111', NULL, '$2y$10$Ks7x7yo/HjVDl2.CSG1x8e/rbmzuBbY3/zoGuqkCQcQfFyxHOhjOe', 'CdZxb2OPR0', '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(5, 'Rosendo Koepp', 'client2@test.com', '18', 'Edwardo', '8478 Quitzon Circles Apt. 196\nEast Verna, SD 56573-9684', '09676651111', NULL, '$2y$10$ayTEZFTmBParOiBFg6RHJeutJhrjZSRP7Z6j8C3Uu04MKA/CSRzGy', '8v6TKNrKue', '2023-01-12 04:06:37', '2023-01-12 04:06:37'),
(6, 'Gerry Me', 'gerry@gmail.com', '23', 'gerry123', 'Macabalan', '+639569264651', NULL, '$2y$10$z5mdqI0GXQ7YQ5zKZjMjl.89COYd0dj4cE/s3vN32Z1F7c6.9KRum', NULL, '2023-01-12 04:10:03', '2023-01-17 05:22:42'),
(7, 'Jung Cookie', 'jung@gmail.com', '23', 'jung27', 'Macabalan', '+639569264651', NULL, '$2y$10$EpR2aiFQYqFtHzCfSxczA.SUXpUdxH40ic3KUkN/SvZAdlT8isLaW', NULL, '2023-01-12 04:11:33', '2023-01-12 04:11:33'),
(8, 'Test1 Newname', 'test1@gmail.com', '23', 'test1', 'test1', '+639569264651', NULL, '123', NULL, '2023-01-17 04:55:00', '2023-01-17 04:55:44'),
(9, 'Test2 Newname', 'test2@gmail.com', '23', 'test2', 'test2', '+639569264651', NULL, '123', NULL, '2023-01-17 04:57:26', '2023-01-17 04:58:05'),
(10, 'Test3 Real Name', 'test3@gmail.com', '23', 'test3', 'test3', '+639569264651', NULL, '$2y$10$gVjkla4Roqoblf5idDrcXuZoy1fJO2/FsFt5BBBnPoz7Mhpbq6ASG', NULL, '2023-01-17 05:16:25', '2023-01-17 05:20:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_client_id_foreign` (`client_id`),
  ADD KEY `appointments_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owners_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tbl_humi`
--
ALTER TABLE `tbl_humi`
  ADD PRIMARY KEY (`humi_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `appointments_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `owners`
--
ALTER TABLE `owners`
  ADD CONSTRAINT `owners_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
