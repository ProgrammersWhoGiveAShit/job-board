-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2017 at 05:50 PM
-- Server version: 5.6.23-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `programmerswhogiveashit`
--
CREATE DATABASE IF NOT EXISTS `programmerswhogiveashit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `programmerswhogiveashit`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` tinyint(4) NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'jeremy.nagel@nuanced.it', 'e7c3387c5647cce985efcb30c46c19b40265866b');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `cover_letter` text COLLATE utf8_unicode_ci,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `websites` text COLLATE utf8_unicode_ci,
  `attachment` text COLLATE utf8_unicode_ci,
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

CREATE TABLE `banlist` (
  `id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `name`, `url`, `content`) VALUES
(1, 'AddThis', 'addthis', '<script type=\"text/javascript\" src=\"//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-541e6f810d78ec0c\"></script>\n<div class=\"addthis_sharing_toolbox\"></div>');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `url`, `sort`) VALUES
(1, 'Environmental Sustainability', 'Jobs for companies that improve environmental sustainability', 'environmental_sustainability', 1),
(2, 'Access to Education', 'Jobs for companies that improve access to education', 'education', 2),
(3, 'Access to Quality Healthcare', 'Jobs for companies that improve access to quality healthcare', 'healthcare', 3),
(4, 'Poverty Alleviation', 'Jobs for companies that help people pull themselves out of poverty', 'poverty_alleviation', 4),
(5, 'Disability Support', 'Jobs for companies that help disabled people', 'disability_support', 6),
(6, 'Mental Health', 'Jobs for companies that promote mental health', 'mental_health', 5),
(7, 'Animal Rights', 'Jobs for companies that help promote animal rights', 'animal_rights', 7),
(8, 'Indigenous Affairs', 'Jobs for organisations that help solve issues facing indigenous people', 'indigenous_affairs', 8),
(9, 'Community Development', 'Jobs for organisations that promote healthy communities', 'community_development', 9),
(10, 'Social Impact', 'Jobs for companies that help lift up the whole for-impact ecosystem', 'social_impact', 10);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `description`, `url`, `sort`) VALUES
(1, 'Remote Friendly', 'Work remotely', 'remote', 1),
(2, 'Sydney', 'Jobs in Sydney', 'sydney', 2),
(3, 'Melbourne', 'Jobs in Melbourne', 'melbourne', 3),
(4, 'San Francisco', 'Jobs in SF', 'san_francisco', 4),
(5, 'New York', 'Jobs in NY', 'new_york', 5),
(6, 'Berlin', 'Jobs in Berlin', 'berlin', 6);

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE `downloads` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` text COLLATE utf8_unicode_ci,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` tinyint(4) DEFAULT NULL,
  `city` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `perks` text COLLATE utf8_unicode_ci,
  `salary` text COLLATE utf8_unicode_ci NOT NULL,
  `impact` text COLLATE utf8_unicode_ci NOT NULL,
  `how_to_apply` text COLLATE utf8_unicode_ci,
  `closing_date` text COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT NULL,
  `token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `category`, `city`, `description`, `perks`, `salary`, `impact`, `how_to_apply`, `closing_date`, `company_name`, `logo`, `url`, `email`, `is_featured`, `token`, `status`, `created`) VALUES
(1, 'Senior Rails Developer at COzero', 1, 2, 'COzero is a Sydney based energy technology company founded in 2006. Our mission is to help companies use energy smarter through an automated analytics engine that crunches data from electricity meters. To date we have supported more than 300 Australian businesses to reduce their energy consumption. We\'re now expanding internationally, taking our Aussie innovation to Japan, Singapore, the USA and beyond. We are motivated by the enormous challenge facing us all: climate scientists are painting a dark picture of the future if we don\'t take action to reduce our impact on the planet. At COzero, we recognise the need for the private sector to step up and take a leadership role.\r\n\r\nIf you are a talented Rails Developer who shares our passion for environmental sustainability then we are looking for you! You will be responsible for contributing to the ongoing development of our innovative cloud based energy management platform EnergyLink.\r\n\r\n## What You Will Do\r\n\r\nLead the ongoing development and maintenance of business-critical customer-facing rails applications;\r\nDevelop and refine the THREE Ps (Policies, Processes and Procedures) surrounding the development and deployment of our rails applications;\r\nContribute to internal libraries and open-source projects;\r\nWork with the product manager to deliver new features and enhancements to our platforms;\r\nAssist in code reviews across the business;\r\nProvide input into the product roadmaps;\r\nContinually review new technologies to help shape the direction of COzero\'s products;\r\nEncourage innovation and foster an environment of continuous improvement;\r\nMentor developers.\r\n\r\n## REQUIREMENTS\r\n\r\n### Who You Are\r\n\r\n- You are an experienced Ruby on Rails developer, you have designed and delivered multiple production-ready Rails-based applications;\r\n- You have a keen interest in cleantech, energy efficiency, environment and/or sustainability;\r\n- You love to GSD!\r\n- You have the courage to stand up for your beliefs;\r\n- You have excellent interpersonal skills - able to collaborate, delegate, facilitate, and negotiate.\r\n\r\n### Like To Have\r\n\r\n- Experience in setting up frameworks for automated testing & continuous integration;\r\n- You have a passion for finding the right technology for the job;\r\n- You have released your own ruby gems (you have scratched an itch);\r\n- You contribute to open source projects.\r\n- Our Stack\r\n- Terraform\r\n- Ruby (Rails, Sinatra, PORO)\r\n- Python (Lambda)\r\n- Node.js\r\n- HTML / CSS / SCSS\r\n- Javascript / React / D3.js\r\n- JSON API / GraphQL\r\n- Buildkite\r\n- PostgreSQL, AWS DynamoDB, AWS Redshift\r\n- Docker\r\n- Atlassian » Bitbucket / Confluence / JIRA / HipChat (soon to be Stride)\r\n- AWS', 'Breakout space with table tennis\r\nCycling facilities with inhouse parking and showers\r\nCObrew - inhouse team brewing of beers and ciders\r\nCOzero Club - rewarding loyalty and support\r\nWellness Days - promoting work-life balance through additional leave\r\nEmployee-driven team building activities\r\nPeer-to-peer rewards programme', '$110-150k AUD', '', '[https://www.comeet.co/jobs/cozero/82.009/rails-developer-senior/AF.408](https://www.comeet.co/jobs/cozero/82.009/infrastructure-engineer-senior/9B.50E)', '12/31/2017', 'COzero', '', 'https://www.cozero.com.au', 'careers@cozero.com.au', 0, '75643ac041c761f0338f86f387c435db', 1, '2017-12-01 14:23:18'),
(2, 'Senior Infrastructure Engineer', 1, 2, 'COzero is a dynamic and rapidly growing company that specialises in energy technology developed in-house. A leader in energy efficiency both domestically and internationally, COzero uses its advanced software suite \"EnergyLink\" to deliver valuable insights into energy usage and savings for our business clients.\r\n\r\nWe are now searching for talented Senior Infrastructure Engineers who will be responsible for overseeing our cloud based infrastructure and overseeing the integration of our Partner\'s enterprise systems into our EnergyLink Partner Platforms.\r\n\r\n## What You Will Do\r\n\r\n- Responsible for using Terraform to continuously deliver and maintain our cloud based infrastructure;\r\n- Develop and refine the THREE Ps (Policies, Processes and Procedures) surrounding infrastructure and operational support systems;\r\n- Provide leadership during the integration of Partner enterprise systems with our products;\r\n- Undertake periods of being the on-call engineer and provide additional support for our products;\r\n- Continually review new technologies and research to help shape the direction of automated infrastructure provisioning and maintenance;\r\n- Assist the DevOps team build new features and deliver them to production for our customers;\r\n- Assist in code reviews across the business\'s codebase;\r\n- Lead a team of engineers and developers;\r\n- Provide input into the product roadmaps through advice on infrastructure and integration.\r\n\r\n## REQUIREMENTS\r\n\r\n### Who You Are\r\n\r\n- You have 5 years experience in a similar role;\r\n- You have worked with infrastructure as code solutions; including implementation using CI/CD;\r\n- You have a thorough understanding of core infrastructure services such as networks, cloud managed servers, databases and third party services;\r\n- You have worked on cloud based infrastructure (AWS, Google Cloud, Azure);\r\n- You have worked in an Agile environment; \r\n- You have excellent interpersonal skills - able to collaborate, delegate, facilitate, and negotiate\r\n- You have a keen interest in cleantech, energy efficiency, environment and/or sustainability\r\n\r\n## Our Stack\r\n\r\n\r\n- Terraform\r\n- Ruby (Rails, Sinatra, PORO)\r\n- Python (Lambda)\r\n- Node.js\r\n- HTML / CSS / SCSS\r\n- Javascript / React / D3.js\r\n- JSON API / GraphQL\r\n- Buildkite\r\n- PostgreSQL, AWS DynamoDB, AWS Redshift\r\n- Docker\r\n- Atlassian » Bitbucket / Confluence / JIRA / HipChat (soon to be Stride)\r\n- AWS\r\n\r\n## APPLY NOW\r\n\r\nCome and join a dynamic, growing company based in a modern converted warehouse in downtown Surry Hills.', 'Breakout space with table tennis\r\nCycling facilities with inhouse parking and showers\r\nCObrew - inhouse team brewing of beers and ciders\r\nCOzero Club - rewarding loyalty and support\r\nWellness Days - promoting work-life balance through additional leave\r\nEmployee-driven team building activities\r\nPeer-to-peer rewards programme', '$110-150k AUD', 'We show businesses where they are wasting energy. These recommendations typically lead to the business reducing their energy usage by ~20% with a corresponding decrease in CO2e emissions.', '[https://www.comeet.co/jobs/cozero/82.009/infrastructure-engineer-senior/9B.50E](https://www.comeet.co/jobs/cozero/82.009/infrastructure-engineer-senior/9B.50E)', '12/31/2017', 'COzero', '', 'https://www.comeet.co/jobs/cozero/82.009/infrastructure-engineer-senior/9B.50E', 'careers@cozero.com.au', 0, '4c888a321af9ab1916d635b33f518214', 1, '2017-12-01 17:42:35'),
(3, 'Senior Backend Developer', 1, 2, 'COzero is a dynamic and rapidly growing company that specialises in energy technology developed in-house. A leader in energy efficiency both domestically and internationally, COzero uses its advanced software suite \"EnergyLink\" to deliver valuable insights into energy usage and savings for our business clients.\r\n\r\nWe are now searching for talented Senior Developers looking to deliver EnergyLink, our cloud based energy management platform. Your role is to ensure the continual development and delivery of the EnergyLink platform, provide input into the roadmap and assist with operational support for internal and external users of the platform.\r\n\r\n## What you will do\r\n\r\n- Development and operational support of our backend services;\r\n- Development and operational support of our other Corporate Platforms;\r\n- Develop and refine the THREE Ps (Policies, Processes and Procedures) surrounding the development and deployment of our backend services;\r\n- Assist in code reviews across the business\'s codebase;\r\n- Assist the DevOps team build new features and deliver them to production for our customers;\r\n- Ongoing improvement of systems and processes for development and delivery;\r\n- Provide input into the product roadmaps through advice on services and back end capabilities;\r\n- Continually review new technologies and research to help shape the direction of our products;\r\n- Encourage innovation and foster an environment of continuous improvement;\r\n- Be a mentor and role model to less experienced staff\r\n\r\n## REQUIREMENTS\r\n\r\n### Who You Are\r\n\r\n- You’re an experienced professional with over five years experience;\r\n- You have a passion for finding the right technology for the job;\r\n- You are most happy delivering clean and effective code;\r\n- You enjoy being part of a collaborative team that is focused on building a product to help people reduce their energy consumption;\r\n- You love to GSD!\r\n- You have the courage to stand up for your beliefs built on sound logic and reasoning;\r\n- You have excellent interpersonal skills - able to collaborate, delegate, facilitate, and negotiate as needed.\r\n\r\n## Our Stack\r\n\r\n- Terraform\r\n- Ruby (Rails, Sinatra, PORO)\r\n- Python (Lambda)\r\n- Node.js\r\n- HTML / CSS / SCSS\r\n- Javascript / React / D3.js\r\n- JSON API / GraphQL\r\n- Buildkite\r\n- PostgreSQL, AWS DynamoDB, AWS Redshift\r\n- Docker\r\n- Atlassian » Bitbucket / Confluence / JIRA / HipChat (soon to be Stride)\r\n- AWS\r\n\r\n## APPLY NOW\r\n\r\nCome and join a dynamic, growing company based in a modern converted warehouse in downtown Surry Hills. https://www.comeet.co/jobs/cozero/82.009/backend-developer-senior/D8.407', 'Not only are we working on reducing wasted energy and water, we also look after our staff!\r\nWe are located in Surry Hills, close to public transport and we support active transport (walking, jogging, running, rollerblading, unicycling, cycling) with on site shower and lockers;\r\nWe want our staff happy and provide a breakout space with table tennis to clear the head and multiple environments in the office to facilitate focus;\r\nWe get together to make our own \"CObrew\" homebrew;\r\nWe reward loyalty and achievements through COzero Club;\r\nWe run quarterly team building activities to reduce the building of silos and encourage all of us to communicate;\r\nWe democratised recognition through Bonus.ly for peer-to-peer rewards', '$110-150k AUD', 'We show businesses where they are wasting energy. These recommendations typically lead to the business reducing their energy usage by ~20% with a corresponding decrease in CO2e emissions.', '[https://www.comeet.co/jobs/cozero/82.009/backend-developer-senior/D8.407](https://www.comeet.co/jobs/cozero/82.009/backend-developer-senior/D8.407)', '12/31/2017', 'COzero', '', 'https://www.cozero.com.au', 'careers@cozero.com.au', 0, '57b66e25b37cf6d6752e836051992826', 1, '2017-12-01 18:45:26'),
(4, 'Full Stack Engineer', 10, 2, '# \r\n\r\ntl;dr\r\n\r\nFull-stack software engineering role in rapidly-growing, funded, social-cause startup, changing the world.\r\n\r\n## Who is Chuffed.org?\r\n\r\nWe\'re a purpose-led company that\'s transforming how people think about charities around the world. Instead of thinking of the charity muggers harassing you on your way to work, we\'re making the face of charity awesome, exciting projects that people want to be part of.\r\n\r\nSince launching in October 2013\\. we\'ve raised over $19\\. for 7,00\\. projects in 2\\. countries. We\'ve reunited a Somali refugee mother with her son that she hadn\'t seen in 2\\. years; we\'ve helped legalise medicinal marijuana for the terminally ill; we\'ve transformed how the Vanuatu Government does disaster relief... and a lot more.\r\n\r\n## What you\'ll be doing?\r\n\r\nYou’ll be joining our Engineering Team in Sydney and will be responsible for:\r\n\r\n*   Building and architecting the future of our product, a crowdfunding platform that helps social cause campaigners raise money and build awareness\r\n*   Making technical and infrastructure choices about how to build the product - you\'ll have a high degree of flexibility to choose what tech you think works\r\n*   Improving the speed at which we work by improving infrastructure process, such as our Bitbucket Pipelines deployment scripts and our testing suites\r\n*   Instrumenting our app to collect the right data to measure the impact of experiments, gain deeper insights on how users are engaging with our product and where they’re leaking out\r\n*   Working with the Engineering Team to ship code every day\r\n\r\nAs you get more familiar with the product and our customers, you’ll be providing input on what product initiatives we should pursue too. In addition to this, we provide opportunities for our engineers to stay connected to our customers through mentoring sessions and events.\r\n\r\n## Benefits\r\n\r\nWhy work for us\r\n\r\nPeople come for the social mission, they stay for the team. We’re a fast-growing social enterprise, that’s backed by some amazing tech investors (Blackbird VC and Bevan Clark) but retains our social mission at our core. We even created our own legal structure over in Australia - the Social Benefit Company - to let us do that. We’ve worked in the social sector for years and changing how it raises money for the amazing work that it does is something that we deeply care about. We’re the place where you can do work that you care about and be part of a fast-moving company at the same time.\r\n\r\nMeet us at the intersection of doing what you love every day and enabling people to take action on issues they care about.\r\n\r\nHere are a few more benefits we have to offer\r\n\r\n*   Flexible work hours (within reason) and the ability to work from home a few days per week.\r\n*   Want to work from London for a while? No problem! Part of our team is there and they are always excited to have us visit.\r\n*   Ownership. You will have a say. In the product, the engineering culture and our tech.\r\n\r\n## The details\r\n\r\n*   Based in Sydney, Australia: Hub Sydney, Darlinghurst.\r\n*   Competitive salary package: we’ll normally pay a mix of cash salary ($80-100k) and equity (0.5%-1%).\r\n*   You’ll report to the CEO (Sydney).\r\n\r\n## How to apply\r\n\r\n*   You can apply via Workable or directly to Prashan Paramanathan at&nbsp;[careers@chuffed.org](mailto:careers@chuffed.org). Please include links to your LinkedIn profile and any Github/Bitbucket repositories or other examples of your work.\r\n*   Applications close 30th November\r\n\r\n## Skills &amp; requirements\r\n\r\n# \r\n\r\nWhat we\'re looking for\r\n\r\nCulture\r\n\r\n*   You care: we\'re a purpose-led company and we love working with people who care about the world around them.\r\n*   You learn: because there\'s always another framework around the corner and a better way of creating value for our customers.\r\n*   You play nice: because we all love coming to work and we want you to too.\r\n\r\n## Technical\r\n\r\n*   Strong in PHP, and ideally experience with Laravel. Fundamental understanding of back end-best practices.\r\n*   Be familiar with MySQL and good structures for efficient database models.\r\n*   Experience building RESTful APIs and working knowledge of Git.\r\n*   Previous experience in a product or agency environment - you\'ve got a few projects under your belt and have incorporated learnings into the next one.\r\n*   Although your role will be weighted towards the backend, as we\'re a small team, you\'ll need to be comfortable stretching yourself into the front end - ideally, you would be familiar with or interested in learning React.\r\n*   Familiar or interested into DevOps tasks as they come up - we use a Laravel/Nginx/MySQL stack on AWS EC2/RDS.\r\n\r\n## Bonus points\r\n\r\n*   You have that balance of getting things done while also caring about how it gets done and what it means for future growth and scalability.\r\n*   You believe the best way to serve our users is to continually ship improvements to them and you\'re passionate about the best way to do this.\r\n*   You’re data driven, curious about what customers value and why they behave in certain ways.\r\n*   You have experience scaling a PHP application, both horizontally and vertically.\r\n*   You\'ve worked with the non-profit/charity/advocacy sector before.\r\n*   Creative thinking and being able to come up with new ways of doing things is something you enjoy.', 'Flexible work hours (within reason) and the ability to work from home a few days per week.\r\nWant to work from London for a while? No problem! Part of our team is there and they are always excited to have us visit.\r\nOwnership. You will have a say. In the product, the engineering culture and our tech.', '$80-100k and equity (0.5%-1%)', 'Since launching in October 2013, we\'ve raised over $19M for 7,000 projects in 20 countries. We\'ve reunited a Somali refugee mother with her son that she hadn\'t seen in 23 years; we\'ve helped legalise medicinal marijuana for the terminally ill; we\'ve transformed how the Vanuatu Government does disaster relief... and a lot more.', 'You can apply via Workable or directly to Prashan Paramanathan at careers@chuffed.org. Please include links to your LinkedIn profile and any Github/Bitbucket repositories or other examples of your work.\r\nApplications close 30th November', '11/30/2017', 'Chuffed.org', '', 'http://www.chuffed.org', 'careers@chuffed.org', 0, '4768540ca49f06fe5dd0402b6f19c297', 1, '2017-12-02 09:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `description`, `url`, `content`) VALUES
(1, 'About', 'About', 'about', 'Programmers Who Give a Shit is a job site for developers who want to make a difference. \r\n\r\nTech can be a powerful tool for achieving positive change. But it can also be a weapon that enables problematic behaviours and disrupts society. This is a job site for programmers who want to make the world better through their work. If you work for a gambling company, a right wing news publisher, an advertising tech company or any of the industries mentioned [here](https://80000hours.org/2015/08/what-are-the-10-most-harmful-jobs/) - sorry: you don\'t give a shit. If you\'re a mercenary just out there looking for interesting problems to solve without thinking about the impact that has on society, then you really don\'t give a shit. \r\n\r\nBut if you care about climate change, want to reduce inequality, welcome refugees, believe in quality education for everyone regardless of their background, are striving to ensure top notch healthcare is available to anyone or any other important societal issue, then this is the job site for you.\r\n'),
(2, 'Contact', 'Contact us', 'contact', 'If you have a specific enquiry, drop me an email: jeremymnagel@gmail.com\r\n\r\nOtherwise join [our LinkedIn group](https://www.linkedin.com/groups/10359564).'),
(3, 'Terms', 'Terms', 'terms', 'Don\'t be a jerk.'),
(13, 'Conditions', 'Conditions', 'conditions', 'Be nice to other people.');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` tinyint(4) NOT NULL,
  `city_id` tinyint(4) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_sent` datetime DEFAULT NULL,
  `is_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `category_id`, `city_id`, `token`, `last_sent`, `is_confirmed`, `created`) VALUES
(1, 'jeremymnagel@gmail.com', 1, 0, 'b89a62f69a00195ac8404c6753991b69', NULL, 0, '2017-12-01 20:47:11'),
(2, 'jeremymnagel+sdf@gmail.com', 1, 0, 'cbdea9e9d6310973f2313603fd786a81', NULL, 0, '2017-12-01 20:56:37'),
(3, 'jeremymnagel+sdfsd@gmail.com', 1, 0, '70e996fce8386559c5a2cab13cc1b276', NULL, 0, '2017-12-01 20:57:02'),
(4, 'jeremymnagel+234324@gmail.com', 1, 0, 'fa99ff625969d612f4a7afbcaa56ee7e', NULL, 0, '2017-12-01 20:57:46'),
(5, 'jeremymnagel+234324aa@gmail.com', 1, 0, '5ef0b52e214115728cceb31bf0e13855', NULL, 1, '2017-12-01 20:59:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banlist`
--
ALTER TABLE `banlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
