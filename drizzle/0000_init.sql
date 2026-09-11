CREATE TABLE `follows` (
	`follower_id` varchar(50) NOT NULL,
	`following_id` varchar(50) NOT NULL,
	CONSTRAINT `follows_follower_id_following_id_pk` PRIMARY KEY(`follower_id`,`following_id`)
);
--> statement-breakpoint
CREATE TABLE `hashtags` (
	`id` int AUTO_INCREMENT NOT NULL,
	`title` varchar(50) NOT NULL,
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `hashtags_id` PRIMARY KEY(`id`),
	CONSTRAINT `hashtags_title_unique` UNIQUE(`title`)
);
--> statement-breakpoint
CREATE TABLE `posts` (
	`id` int AUTO_INCREMENT NOT NULL,
	`content` text NOT NULL,
	`img` varchar(255),
	`user_id` varchar(50),
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `posts_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `posts_to_hashtags` (
	`post_id` int NOT NULL,
	`hashtag_id` int NOT NULL,
	CONSTRAINT `posts_to_hashtags_post_id_hashtag_id_pk` PRIMARY KEY(`post_id`,`hashtag_id`)
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` varchar(50) NOT NULL,
	`nick` varchar(50) NOT NULL,
	`password` varchar(100),
	`provider` varchar(20) DEFAULT 'local',
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `users_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `follows` ADD CONSTRAINT `follows_follower_id_users_id_fk` FOREIGN KEY (`follower_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `follows` ADD CONSTRAINT `follows_following_id_users_id_fk` FOREIGN KEY (`following_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `posts` ADD CONSTRAINT `posts_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `posts_to_hashtags` ADD CONSTRAINT `posts_to_hashtags_post_id_posts_id_fk` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `posts_to_hashtags` ADD CONSTRAINT `posts_to_hashtags_hashtag_id_hashtags_id_fk` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtags`(`id`) ON DELETE no action ON UPDATE no action;