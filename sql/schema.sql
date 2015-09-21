CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `login` varchar(255) NOT NULL UNIQUE,
  `password_hash` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `created_at` datetime NOT NULL,
  `user_id` int,
  `login` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `succeeded` tinyint NOT NULL
) DEFAULT CHARSET=utf8;

CREATE INDEX user_idx_login ON users (login);
CREATE INDEX login_log_idx_user_id_succeeded_id ON login_log (user_id, succeeded, id);
CREATE INDEX login_log_idx_user_id_ip_id ON login_log (user_id, ip, id);
CREATE INDEX login_log_idx_succeeded_ip_id ON login_log (succeeded, ip, id);
CREATE INDEX login_log_idx_ip_user_id ON login_log (ip, user_id);