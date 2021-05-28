-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: conftracker-db
-- Generation Time: May 28, 2021 at 05:34 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `conftracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ASSOCIATED_POLICY`
--

CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

INSERT INTO `AUTHENTICATION_EXECUTION` (`ID`, `ALIAS`, `AUTHENTICATOR`, `REALM_ID`, `FLOW_ID`, `REQUIREMENT`, `PRIORITY`, `AUTHENTICATOR_FLOW`, `AUTH_FLOW_ID`, `AUTH_CONFIG`) VALUES
('0071a0df-8fd8-4cb1-92bb-61c5aa25c653', NULL, 'registration-profile-action', 'myrealm', 'bdbb043c-749b-4fd4-b8ca-0771bf77390f', 0, 40, b'0', NULL, NULL),
('00d4c0f0-5c54-4647-9fc7-965d371202fe', NULL, 'registration-password-action', 'myrealm', 'bdbb043c-749b-4fd4-b8ca-0771bf77390f', 0, 50, b'0', NULL, NULL),
('03f9b45c-ccf2-465d-aead-a13ad463458b', NULL, 'reset-otp', 'myrealm', '45b37b01-9b85-40c7-9bc9-fbe624863687', 0, 20, b'0', NULL, NULL),
('040c8cef-592d-4aa1-bb4b-b3d46119bd8b', NULL, 'auth-spnego', 'myrealm', 'f6c29c7b-eff3-4db1-a9c6-f80fb3c5d918', 3, 20, b'0', NULL, NULL),
('0587e08a-6b47-4050-8d50-de438e6205c0', NULL, 'auth-otp-form', 'master', 'dcaad799-bea1-44f4-bb3a-c7fa81fb54c0', 0, 20, b'0', NULL, NULL),
('096fcd6f-b6fc-4b8a-a321-089ff34f0f67', NULL, 'registration-profile-action', 'master', '064cc9e4-491d-4749-a910-3e002460d895', 0, 40, b'0', NULL, NULL),
('0f795881-cf5a-4787-8f3d-25fc0493ef21', NULL, 'auth-cookie', 'master', '53a4e03e-3ed9-4d1c-9542-e35c7ef24f8d', 2, 10, b'0', NULL, NULL),
('107f064c-843f-45a5-8a53-af4c8076478b', NULL, 'reset-otp', 'master', '31d1dfc7-b771-417d-8fbb-23033ffb7205', 0, 20, b'0', NULL, NULL),
('1398712d-5e94-4fa0-ae83-cbdb64975688', NULL, 'auth-otp-form', 'myrealm', '4825fae0-f1f6-4b62-a1c7-4afba74f2314', 0, 20, b'0', NULL, NULL),
('14adf5e9-1088-45a0-bd2f-26d8ccbf6886', NULL, 'idp-username-password-form', 'master', '6ae95478-7c17-420c-99fa-0453d021fd92', 0, 10, b'0', NULL, NULL),
('14dc14b6-a3e0-4200-8cc3-5688d9ac22d4', NULL, 'conditional-user-configured', 'master', 'd01dfa72-4a0a-458d-928b-47fa3c7ad7f0', 0, 10, b'0', NULL, NULL),
('15fbb6d1-e356-4234-aa0c-a4d5f383ee44', NULL, 'auth-spnego', 'master', '5d653bd7-1d7e-40ec-b09a-05b89d1490fb', 3, 30, b'0', NULL, NULL),
('17010407-f6c2-46d8-8036-5643d66a27a1', NULL, 'registration-recaptcha-action', 'master', '064cc9e4-491d-4749-a910-3e002460d895', 3, 60, b'0', NULL, NULL),
('18528be3-ef5f-4b90-827d-0bb0dfa9c282', NULL, 'conditional-user-configured', 'myrealm', '1239c450-c503-4766-bff2-d8c4a4b92f90', 0, 10, b'0', NULL, NULL),
('1a49aec6-9f8c-43a8-83a8-5cf4497104f9', NULL, 'registration-password-action', 'master', '064cc9e4-491d-4749-a910-3e002460d895', 0, 50, b'0', NULL, NULL),
('1e53b11c-3ecc-4780-8dcc-1d70d31ca056', NULL, 'registration-user-creation', 'myrealm', 'bdbb043c-749b-4fd4-b8ca-0771bf77390f', 0, 20, b'0', NULL, NULL),
('1fb45dd1-4115-42f3-8f6e-642c998edccb', NULL, 'reset-credential-email', 'myrealm', '1c7e7141-12d3-414a-8aac-fa41934cdfc7', 0, 20, b'0', NULL, NULL),
('200f0a9d-7c71-491e-aa4c-3468734166f6', NULL, NULL, 'master', '695f9320-7fbf-40b3-b669-3250656fd3b1', 1, 40, b'1', '31d1dfc7-b771-417d-8fbb-23033ffb7205', NULL),
('25cfec28-b7cb-415c-853a-caa63bede052', NULL, 'client-secret', 'master', '54d06c50-ef99-496b-99b0-ce192cd2ed81', 2, 10, b'0', NULL, NULL),
('29c838c7-b754-421c-a90c-85655bbe07bb', NULL, 'client-jwt', 'master', '54d06c50-ef99-496b-99b0-ce192cd2ed81', 2, 20, b'0', NULL, NULL),
('2a85764f-d7a5-4237-8fda-b3f90424a0d7', NULL, 'no-cookie-redirect', 'myrealm', '69bfcf18-664e-439c-88e8-799d21071ead', 0, 10, b'0', NULL, NULL),
('2c861138-a9ab-4ac8-a2bd-d8e2a98c1573', NULL, NULL, 'master', '4c0b0eb7-ab27-4b34-899b-2918817dd97d', 0, 20, b'1', 'c7b07be1-b5dd-47d6-9dcc-6642f82e57f3', NULL),
('2fb56e4c-10eb-44bc-88fc-e1fc330a5ba0', NULL, 'reset-credential-email', 'master', '695f9320-7fbf-40b3-b669-3250656fd3b1', 0, 20, b'0', NULL, NULL),
('370d4054-a3d9-4aeb-8821-80adf67e7148', NULL, NULL, 'myrealm', '69bfcf18-664e-439c-88e8-799d21071ead', 0, 20, b'1', '85a20c2f-4a30-401b-a3fc-056e6ad8eb95', NULL),
('38761391-eaeb-4a6f-899d-cab5ea2d5ac2', NULL, 'identity-provider-redirector', 'myrealm', 'f6c29c7b-eff3-4db1-a9c6-f80fb3c5d918', 2, 25, b'0', NULL, NULL),
('396a641d-5cb1-41c1-af72-9ef953616240', NULL, 'idp-review-profile', 'master', '6f524494-7227-4d07-87f3-8befd802053c', 0, 10, b'0', NULL, 'cae8980b-36b1-4505-b381-b25996e12f58'),
('396ec63e-17b6-4438-936a-b770b318acd4', NULL, 'conditional-user-configured', 'myrealm', '45b37b01-9b85-40c7-9bc9-fbe624863687', 0, 10, b'0', NULL, NULL),
('3ae6aeda-b8c2-4e09-86b7-ecd0f6cb6938', NULL, NULL, 'master', '75d9611c-7aaf-450d-9bef-a4c92263157e', 1, 20, b'1', 'd01dfa72-4a0a-458d-928b-47fa3c7ad7f0', NULL),
('3ec12202-c34f-4154-b60c-6c4ab0397159', NULL, NULL, 'myrealm', '6eedde4e-a0c3-4e32-96a8-1bca1a8c4e3d', 0, 20, b'1', '1b2afea6-673a-40d5-8b00-65ba003af03f', NULL),
('416249d3-2530-42ae-90ae-473b2e448e7f', NULL, NULL, 'myrealm', 'c7e3af3f-7fe8-4e66-ba29-4054491520e4', 1, 20, b'1', '4825fae0-f1f6-4b62-a1c7-4afba74f2314', NULL),
('42af6e12-c969-4de6-8f5e-05a522503003', NULL, 'http-basic-authenticator', 'myrealm', '92a158be-88cd-485f-ae41-10b1581e1bb8', 0, 10, b'0', NULL, NULL),
('4384f7dc-9fd4-48ea-a3dc-4b3999a71d24', NULL, 'idp-create-user-if-unique', 'master', '1b374255-9507-49d0-a803-8e8e6460e784', 2, 10, b'0', NULL, '798d606d-36c3-4721-8596-fd73c411563e'),
('450752b3-fc5f-4ee9-b808-36bcdf1f42f1', NULL, 'client-secret', 'myrealm', 'a5b69c5c-c486-4a2a-86d2-f0ba7a8f21db', 2, 10, b'0', NULL, NULL),
('467c7760-82f7-4c51-bebb-0567c253eef2', NULL, 'direct-grant-validate-username', 'myrealm', '66e8f4cc-c25c-4de6-88db-5ebc6a9914f4', 0, 10, b'0', NULL, NULL),
('486214a2-2086-4232-b26a-8575a76af500', NULL, 'direct-grant-validate-otp', 'master', 'a1ac68e4-9e31-4260-a22a-b1a5eee1a3f0', 0, 20, b'0', NULL, NULL),
('49cbc9bb-4dce-4532-bc55-30f72fb370d4', NULL, 'auth-username-password-form', 'myrealm', '454dfc67-ccd9-45c2-8f2d-013d653e0b43', 0, 10, b'0', NULL, NULL),
('547fec36-c60b-4ee8-8250-5f8d1f6ee726', NULL, 'registration-page-form', 'myrealm', 'd7e1e1bf-8986-4259-9eb1-dd3dd3f6784a', 0, 10, b'1', 'bdbb043c-749b-4fd4-b8ca-0771bf77390f', NULL),
('5609a19b-390e-42d6-bb10-beda9bef123f', NULL, 'client-x509', 'master', '54d06c50-ef99-496b-99b0-ce192cd2ed81', 2, 40, b'0', NULL, NULL),
('590af4d5-2c14-45a5-a7e3-5ce0181ca83e', NULL, 'basic-auth', 'myrealm', '85a20c2f-4a30-401b-a3fc-056e6ad8eb95', 0, 10, b'0', NULL, NULL),
('68a25e74-08b1-4107-af79-8dcaf21da63f', NULL, 'registration-page-form', 'master', '9d2e5ee2-2777-4d36-beb6-119f53850624', 0, 10, b'1', '064cc9e4-491d-4749-a910-3e002460d895', NULL),
('6d0e25ed-4071-474a-89ab-e9bceab209e5', NULL, 'idp-username-password-form', 'myrealm', 'c7e3af3f-7fe8-4e66-ba29-4054491520e4', 0, 10, b'0', NULL, NULL),
('6f6cd042-6dec-49c6-a941-38f173fe3cb5', NULL, 'direct-grant-validate-otp', 'myrealm', '1239c450-c503-4766-bff2-d8c4a4b92f90', 0, 20, b'0', NULL, NULL),
('7c65ad8a-4c42-456c-b2f8-87c7dce9209f', NULL, 'docker-http-basic-authenticator', 'myrealm', '3bec6925-ceba-4aae-9a4a-e665ca7fea57', 0, 10, b'0', NULL, NULL),
('7eaba63c-31f3-4c30-921f-f284852cb7ee', NULL, 'registration-user-creation', 'master', '064cc9e4-491d-4749-a910-3e002460d895', 0, 20, b'0', NULL, NULL),
('7eb2ea51-d456-48b6-b969-b77bfcf27f09', NULL, NULL, 'myrealm', '66e8f4cc-c25c-4de6-88db-5ebc6a9914f4', 1, 30, b'1', '1239c450-c503-4766-bff2-d8c4a4b92f90', NULL),
('7f4508b7-6202-49f4-9628-11860a3efde4', NULL, 'basic-auth', 'master', '5d653bd7-1d7e-40ec-b09a-05b89d1490fb', 0, 10, b'0', NULL, NULL),
('829ff00d-1d1e-4856-98bd-f0f4ca646008', NULL, 'registration-recaptcha-action', 'myrealm', 'bdbb043c-749b-4fd4-b8ca-0771bf77390f', 3, 60, b'0', NULL, NULL),
('86e4eef1-d00a-4976-9cc0-97ee2b2f2ca5', NULL, NULL, 'master', '1b374255-9507-49d0-a803-8e8e6460e784', 2, 20, b'1', '4c0b0eb7-ab27-4b34-899b-2918817dd97d', NULL),
('8868696e-4c75-4019-a1ca-4ebc4ae6e28e', NULL, 'conditional-user-configured', 'master', '31d1dfc7-b771-417d-8fbb-23033ffb7205', 0, 10, b'0', NULL, NULL),
('8b6c1e8c-b60f-4c60-8945-5629c64dcda2', NULL, 'conditional-user-configured', 'myrealm', '4825fae0-f1f6-4b62-a1c7-4afba74f2314', 0, 10, b'0', NULL, NULL),
('8c6a2052-99fb-4b05-becb-9dde3debb8a2', NULL, NULL, 'myrealm', '1c7e7141-12d3-414a-8aac-fa41934cdfc7', 1, 40, b'1', '45b37b01-9b85-40c7-9bc9-fbe624863687', NULL),
('8eb0b047-8e63-4ab8-a3f2-0189a97cfe11', NULL, 'client-jwt', 'myrealm', 'a5b69c5c-c486-4a2a-86d2-f0ba7a8f21db', 2, 20, b'0', NULL, NULL),
('8ec12ab8-673d-4e96-bc4a-07594d417aee', NULL, 'idp-confirm-link', 'myrealm', '6eedde4e-a0c3-4e32-96a8-1bca1a8c4e3d', 0, 10, b'0', NULL, NULL),
('930e32a4-c317-4592-baa8-fedfa3b42a69', NULL, 'client-secret-jwt', 'myrealm', 'a5b69c5c-c486-4a2a-86d2-f0ba7a8f21db', 2, 30, b'0', NULL, NULL),
('98ee8ba4-acc1-4dcd-9955-f762df961d42', NULL, 'idp-email-verification', 'myrealm', '1b2afea6-673a-40d5-8b00-65ba003af03f', 2, 10, b'0', NULL, NULL),
('9b3b1783-e06f-4fd3-a6f9-5f96a3a5e078', NULL, 'conditional-user-configured', 'master', 'dcaad799-bea1-44f4-bb3a-c7fa81fb54c0', 0, 10, b'0', NULL, NULL),
('a1dd7887-8eb3-4c25-b44c-dbcbfe931de2', NULL, 'idp-review-profile', 'myrealm', 'e66877bf-06e7-4554-a645-71e923f58996', 0, 10, b'0', NULL, '42f3e73f-ce22-4b59-806c-889a3dc0d5a7'),
('a825df5c-9fc3-46f2-bdbd-b17056023ee7', NULL, NULL, 'master', '6ae95478-7c17-420c-99fa-0453d021fd92', 1, 20, b'1', 'dcaad799-bea1-44f4-bb3a-c7fa81fb54c0', NULL),
('a89dc789-399b-4f53-934e-1888102108f3', NULL, 'auth-cookie', 'myrealm', 'f6c29c7b-eff3-4db1-a9c6-f80fb3c5d918', 2, 10, b'0', NULL, NULL),
('a9d22440-a16f-4015-bc2e-19423f90e496', NULL, 'direct-grant-validate-username', 'master', '9b92f10b-3f0e-4f34-a478-9ffa0be1bd3c', 0, 10, b'0', NULL, NULL),
('b25c2229-a20c-4f44-8656-638fb1c77f67', NULL, 'identity-provider-redirector', 'master', '53a4e03e-3ed9-4d1c-9542-e35c7ef24f8d', 2, 25, b'0', NULL, NULL),
('b27ea1a9-b38c-40ac-8eaf-09333f51dea2', NULL, 'direct-grant-validate-password', 'master', '9b92f10b-3f0e-4f34-a478-9ffa0be1bd3c', 0, 20, b'0', NULL, NULL),
('b3a4cfd6-44dc-4295-934a-f4bcf17936ca', NULL, 'auth-otp-form', 'master', 'd01dfa72-4a0a-458d-928b-47fa3c7ad7f0', 0, 20, b'0', NULL, NULL),
('b698dd6f-b3ae-4c4c-b874-bd525ab0ba68', NULL, NULL, 'master', '9b92f10b-3f0e-4f34-a478-9ffa0be1bd3c', 1, 30, b'1', 'a1ac68e4-9e31-4260-a22a-b1a5eee1a3f0', NULL),
('b730c6de-0030-4b3e-a635-6a87c52c5f38', NULL, 'basic-auth-otp', 'master', '5d653bd7-1d7e-40ec-b09a-05b89d1490fb', 3, 20, b'0', NULL, NULL),
('ba13ede7-8b93-47de-992e-8b88545acfd7', NULL, 'reset-credentials-choose-user', 'myrealm', '1c7e7141-12d3-414a-8aac-fa41934cdfc7', 0, 10, b'0', NULL, NULL),
('bab7ca91-b7bb-46d8-ba51-3804698523dc', NULL, 'reset-credentials-choose-user', 'master', '695f9320-7fbf-40b3-b669-3250656fd3b1', 0, 10, b'0', NULL, NULL),
('bb3ffe79-2311-427f-bf9b-d482389d009b', NULL, 'no-cookie-redirect', 'master', '219310dd-139c-4266-991e-3fddcdd3de43', 0, 10, b'0', NULL, NULL),
('bb4a0a64-0404-4401-ac1a-b602c47f56ce', NULL, NULL, 'myrealm', 'e66877bf-06e7-4554-a645-71e923f58996', 0, 20, b'1', 'c4a4b316-6023-46e7-908f-537c821d501f', NULL),
('bc7657d3-651d-4cd5-ad9f-ebac755fb079', NULL, 'client-secret-jwt', 'master', '54d06c50-ef99-496b-99b0-ce192cd2ed81', 2, 30, b'0', NULL, NULL),
('bf2be061-9f28-41e1-ac8d-56add745a161', NULL, 'auth-spnego', 'master', '53a4e03e-3ed9-4d1c-9542-e35c7ef24f8d', 3, 20, b'0', NULL, NULL),
('bfc9df17-81c9-434e-8490-5c1ac2fe8ac9', NULL, 'reset-password', 'myrealm', '1c7e7141-12d3-414a-8aac-fa41934cdfc7', 0, 30, b'0', NULL, NULL),
('c38dcf6d-b8ed-49e0-86e5-f9cd40ff0457', NULL, 'basic-auth-otp', 'myrealm', '85a20c2f-4a30-401b-a3fc-056e6ad8eb95', 3, 20, b'0', NULL, NULL),
('cb98dc7c-648f-450b-bc7d-44b3a5f378d9', NULL, NULL, 'myrealm', '1b2afea6-673a-40d5-8b00-65ba003af03f', 2, 20, b'1', 'c7e3af3f-7fe8-4e66-ba29-4054491520e4', NULL),
('cd3ddea5-c377-4a1c-85af-5d3d00fb4ff1', NULL, 'reset-password', 'master', '695f9320-7fbf-40b3-b669-3250656fd3b1', 0, 30, b'0', NULL, NULL),
('dad0892d-19e2-4bff-a532-29800ca39058', NULL, NULL, 'master', 'c7b07be1-b5dd-47d6-9dcc-6642f82e57f3', 2, 20, b'1', '6ae95478-7c17-420c-99fa-0453d021fd92', NULL),
('dcd0f8d7-2f24-4668-b230-24eebdc314bf', NULL, 'idp-email-verification', 'master', 'c7b07be1-b5dd-47d6-9dcc-6642f82e57f3', 2, 10, b'0', NULL, NULL),
('dd909747-7ab4-481f-bec1-43c6f7b5bb31', NULL, 'auth-username-password-form', 'master', '75d9611c-7aaf-450d-9bef-a4c92263157e', 0, 10, b'0', NULL, NULL),
('e078c5d9-3f5b-4440-b08b-05902744e7cc', NULL, 'client-x509', 'myrealm', 'a5b69c5c-c486-4a2a-86d2-f0ba7a8f21db', 2, 40, b'0', NULL, NULL),
('e39ec760-45ae-49b8-88b0-7587745f528e', NULL, 'auth-otp-form', 'myrealm', '5cc2fcb2-fa6f-4e89-a503-9ca49440e0b4', 0, 20, b'0', NULL, NULL),
('e6cf87b7-6c2a-44d7-acfc-3f73638cf0e3', NULL, 'conditional-user-configured', 'master', 'a1ac68e4-9e31-4260-a22a-b1a5eee1a3f0', 0, 10, b'0', NULL, NULL),
('e8be99ff-f0d5-4e9a-a8ba-0161101d728f', NULL, NULL, 'master', '6f524494-7227-4d07-87f3-8befd802053c', 0, 20, b'1', '1b374255-9507-49d0-a803-8e8e6460e784', NULL),
('ebf7a2d7-d9d5-4f87-8903-dc8d934af6fb', NULL, 'conditional-user-configured', 'myrealm', '5cc2fcb2-fa6f-4e89-a503-9ca49440e0b4', 0, 10, b'0', NULL, NULL),
('efdea338-15fd-445d-a416-183e983d5830', NULL, 'http-basic-authenticator', 'master', '541a8c9b-b3ed-4787-90d3-2fdbb96a8158', 0, 10, b'0', NULL, NULL),
('f0e0c49c-2434-4bd6-a5a2-16b468342f31', NULL, 'idp-create-user-if-unique', 'myrealm', 'c4a4b316-6023-46e7-908f-537c821d501f', 2, 10, b'0', NULL, 'c55323f3-6622-4e4f-bb1a-00d6b8d4edb5'),
('f221e850-156e-493b-b34b-fef9b91ec9fb', NULL, 'direct-grant-validate-password', 'myrealm', '66e8f4cc-c25c-4de6-88db-5ebc6a9914f4', 0, 20, b'0', NULL, NULL),
('f2b6e304-a36d-48aa-a8fc-f5b20cab743a', NULL, NULL, 'master', '219310dd-139c-4266-991e-3fddcdd3de43', 0, 20, b'1', '5d653bd7-1d7e-40ec-b09a-05b89d1490fb', NULL),
('f35027ba-a023-4440-8f81-5d72d862d452', NULL, NULL, 'master', '53a4e03e-3ed9-4d1c-9542-e35c7ef24f8d', 2, 30, b'1', '75d9611c-7aaf-450d-9bef-a4c92263157e', NULL),
('f6008935-0b8d-4a7e-8d40-78fcf8bf9ce7', NULL, NULL, 'myrealm', 'f6c29c7b-eff3-4db1-a9c6-f80fb3c5d918', 2, 30, b'1', '454dfc67-ccd9-45c2-8f2d-013d653e0b43', NULL),
('f750e67d-5f15-469f-935b-777a380709a7', NULL, 'docker-http-basic-authenticator', 'master', 'c07cd2a3-0a72-4800-894a-e334c0a5c828', 0, 10, b'0', NULL, NULL),
('f874fba7-dae6-484c-8f5f-e9770daee994', NULL, NULL, 'myrealm', '454dfc67-ccd9-45c2-8f2d-013d653e0b43', 1, 20, b'1', '5cc2fcb2-fa6f-4e89-a503-9ca49440e0b4', NULL),
('f8a25da2-dfd7-4cdc-a588-017626408b4b', NULL, 'auth-spnego', 'myrealm', '85a20c2f-4a30-401b-a3fc-056e6ad8eb95', 3, 30, b'0', NULL, NULL),
('fe5839ea-6fe6-4efe-80af-7ec03830e54f', NULL, NULL, 'myrealm', 'c4a4b316-6023-46e7-908f-537c821d501f', 2, 20, b'1', '6eedde4e-a0c3-4e32-96a8-1bca1a8c4e3d', NULL),
('ffcbaadc-d33b-47e9-a48f-710c444a4c9c', NULL, 'idp-confirm-link', 'master', '4c0b0eb7-ab27-4b34-899b-2918817dd97d', 0, 10, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

INSERT INTO `AUTHENTICATION_FLOW` (`ID`, `ALIAS`, `DESCRIPTION`, `REALM_ID`, `PROVIDER_ID`, `TOP_LEVEL`, `BUILT_IN`) VALUES
('064cc9e4-491d-4749-a910-3e002460d895', 'registration form', 'registration form', 'master', 'form-flow', b'0', b'1'),
('1239c450-c503-4766-bff2-d8c4a4b92f90', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'myrealm', 'basic-flow', b'0', b'1'),
('1b2afea6-673a-40d5-8b00-65ba003af03f', 'Account verification options', 'Method with which to verity the existing account', 'myrealm', 'basic-flow', b'0', b'1'),
('1b374255-9507-49d0-a803-8e8e6460e784', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', b'0', b'1'),
('1c7e7141-12d3-414a-8aac-fa41934cdfc7', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'myrealm', 'basic-flow', b'1', b'1'),
('219310dd-139c-4266-991e-3fddcdd3de43', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', b'1', b'1'),
('31d1dfc7-b771-417d-8fbb-23033ffb7205', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', b'0', b'1'),
('3bec6925-ceba-4aae-9a4a-e665ca7fea57', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'myrealm', 'basic-flow', b'1', b'1'),
('454dfc67-ccd9-45c2-8f2d-013d653e0b43', 'forms', 'Username, password, otp and other auth forms.', 'myrealm', 'basic-flow', b'0', b'1'),
('45b37b01-9b85-40c7-9bc9-fbe624863687', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'myrealm', 'basic-flow', b'0', b'1'),
('4825fae0-f1f6-4b62-a1c7-4afba74f2314', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'myrealm', 'basic-flow', b'0', b'1'),
('4c0b0eb7-ab27-4b34-899b-2918817dd97d', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', b'0', b'1'),
('53a4e03e-3ed9-4d1c-9542-e35c7ef24f8d', 'browser', 'browser based authentication', 'master', 'basic-flow', b'1', b'1'),
('541a8c9b-b3ed-4787-90d3-2fdbb96a8158', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', b'1', b'1'),
('54d06c50-ef99-496b-99b0-ce192cd2ed81', 'clients', 'Base authentication for clients', 'master', 'client-flow', b'1', b'1'),
('5cc2fcb2-fa6f-4e89-a503-9ca49440e0b4', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'myrealm', 'basic-flow', b'0', b'1'),
('5d653bd7-1d7e-40ec-b09a-05b89d1490fb', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', b'0', b'1'),
('66e8f4cc-c25c-4de6-88db-5ebc6a9914f4', 'direct grant', 'OpenID Connect Resource Owner Grant', 'myrealm', 'basic-flow', b'1', b'1'),
('695f9320-7fbf-40b3-b669-3250656fd3b1', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', b'1', b'1'),
('69bfcf18-664e-439c-88e8-799d21071ead', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'myrealm', 'basic-flow', b'1', b'1'),
('6ae95478-7c17-420c-99fa-0453d021fd92', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', b'0', b'1'),
('6eedde4e-a0c3-4e32-96a8-1bca1a8c4e3d', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'myrealm', 'basic-flow', b'0', b'1'),
('6f524494-7227-4d07-87f3-8befd802053c', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', b'1', b'1'),
('75d9611c-7aaf-450d-9bef-a4c92263157e', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', b'0', b'1'),
('85a20c2f-4a30-401b-a3fc-056e6ad8eb95', 'Authentication Options', 'Authentication options.', 'myrealm', 'basic-flow', b'0', b'1'),
('92a158be-88cd-485f-ae41-10b1581e1bb8', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'myrealm', 'basic-flow', b'1', b'1'),
('9b92f10b-3f0e-4f34-a478-9ffa0be1bd3c', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', b'1', b'1'),
('9d2e5ee2-2777-4d36-beb6-119f53850624', 'registration', 'registration flow', 'master', 'basic-flow', b'1', b'1'),
('a1ac68e4-9e31-4260-a22a-b1a5eee1a3f0', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('a5b69c5c-c486-4a2a-86d2-f0ba7a8f21db', 'clients', 'Base authentication for clients', 'myrealm', 'client-flow', b'1', b'1'),
('bdbb043c-749b-4fd4-b8ca-0771bf77390f', 'registration form', 'registration form', 'myrealm', 'form-flow', b'0', b'1'),
('c07cd2a3-0a72-4800-894a-e334c0a5c828', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', b'1', b'1'),
('c4a4b316-6023-46e7-908f-537c821d501f', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'myrealm', 'basic-flow', b'0', b'1'),
('c7b07be1-b5dd-47d6-9dcc-6642f82e57f3', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', b'0', b'1'),
('c7e3af3f-7fe8-4e66-ba29-4054491520e4', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'myrealm', 'basic-flow', b'0', b'1'),
('d01dfa72-4a0a-458d-928b-47fa3c7ad7f0', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('d7e1e1bf-8986-4259-9eb1-dd3dd3f6784a', 'registration', 'registration flow', 'myrealm', 'basic-flow', b'1', b'1'),
('dcaad799-bea1-44f4-bb3a-c7fa81fb54c0', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('e66877bf-06e7-4554-a645-71e923f58996', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'myrealm', 'basic-flow', b'1', b'1'),
('f6c29c7b-eff3-4db1-a9c6-f80fb3c5d918', 'browser', 'browser based authentication', 'myrealm', 'basic-flow', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

INSERT INTO `AUTHENTICATOR_CONFIG` (`ID`, `ALIAS`, `REALM_ID`) VALUES
('42f3e73f-ce22-4b59-806c-889a3dc0d5a7', 'review profile config', 'myrealm'),
('798d606d-36c3-4721-8596-fd73c411563e', 'create unique user config', 'master'),
('c55323f3-6622-4e4f-bb1a-00d6b8d4edb5', 'create unique user config', 'myrealm'),
('cae8980b-36b1-4505-b381-b25996e12f58', 'review profile config', 'master');

-- --------------------------------------------------------

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` (`AUTHENTICATOR_ID`, `VALUE`, `NAME`) VALUES
('42f3e73f-ce22-4b59-806c-889a3dc0d5a7', 'missing', 'update.profile.on.first.login'),
('798d606d-36c3-4721-8596-fd73c411563e', 'false', 'require.password.update.after.registration'),
('c55323f3-6622-4e4f-bb1a-00d6b8d4edb5', 'false', 'require.password.update.after.registration'),
('cae8980b-36b1-4505-b381-b25996e12f58', 'missing', 'update.profile.on.first.login');

-- --------------------------------------------------------

--
-- Table structure for table `BROKER_LINK`
--

CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfp`
--

CREATE TABLE `cfp` (
  `id` int(11) NOT NULL,
  `conference` varchar(250) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cfp_close_date` date DEFAULT NULL,
  `url` varchar(250) NOT NULL,
  `cfp_url` varchar(250) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cfp`
--

INSERT INTO `cfp` (`id`, `conference`, `start_date`, `end_date`, `cfp_close_date`, `url`, `cfp_url`, `created_by`) VALUES
(2, 'Node Congress', '2021-02-18', '2021-02-19', '2021-01-10', 'https://nodecongress.com', 'https://docs.google.com/forms/d/e/1FAIpQLSf89PQwYbW1zizpOtC2SZ77acrCXXqhmT-kza70Nuk6nBriqQ/viewform', NULL),
(4, 'Techorama', '2021-05-17', '2021-05-19', '2021-01-31', 'https://techorama.be', 'https://sessionize.com/techorama2021/', NULL),
(5, 'MSCC', '2021-03-18', '2021-03-20', '2021-01-20', 'https://conference.mscc.mu/', 'https://sessionize.com/developers-conference-2021---mau', NULL),
(6, 'JSConf Budapest', '2021-09-23', '2021-09-24', '2021-02-28', 'https://jsconfbp.com/', 'https://sessionize.com/jsconf-budapest-2021', NULL),
(7, 'Web a Quebec', '2021-06-15', '2021-06-17', '2021-01-19', 'http://webaquebec.org', 'http://webaquebec.org', NULL),
(8, 'Confoo', '2021-02-22', '2021-02-26', '2021-01-15', 'http://confoo.ca', 'http://confoo.ca', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(9, 'Yet Another Conference', '2021-01-14', '2021-01-14', '2021-01-14', 'http://test.com', 'http://blah.com', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(10, 'DevRelCon Tokyo', '2021-06-05', '2021-06-05', '2021-03-15', 'https://tokyo-2020.devrel.net/', 'https://www.papercall.io/devrelcon-tokyo-2021', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(11, 'Open Source North', '2021-05-20', '2021-05-20', '2021-01-15', 'https://opensourcenorth.com/', 'https://opensourcenorth.com/#callforspeakers', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(12, 'IPC Berlin', '2021-06-07', '2021-06-11', '2021-01-14', 'https://phpconference.com/', 'https://callforpapers.sandsmedia.com', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(13, 'Developer Week Nuremberg', '2021-06-28', '2021-07-03', '2021-01-14', 'https://www.developer-week.de/', 'https://sessionize.com/developer-week-21/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(14, 'DevOpsDays Seattle', '2021-05-04', '2021-05-04', '2021-02-01', 'https://devopsdays.org/events/2021-seattle/welcome/', 'https://sessionize.com/devopsdays-seattle-2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(15, 'StrapiConf', '2021-04-22', '2021-04-22', '2021-01-18', 'https://www.strapi.io/strapi-conf-2021', 'https://docs.google.com/forms/d/e/1FAIpQLScUYkXm67c-yHccRYsskeUMWO4uwoWtFsBBElmVlrFYYfUyow/viewform?__hstc&__hssc&hsCtaTracking=1264dc1c-3a0f-4973-93af-562cd6b7aa25%7C94e02ea6-3120-40e8-817c-c6ebabf9c744', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(16, 'DevOpsCon Berlin', '2021-06-14', '2021-06-17', '2021-01-18', 'https://devopscon.io/', 'https://callforpapers.sandsmedia.com/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(17, 'IoTCon', '2021-06-21', '2021-06-23', '2021-01-18', 'https://iotcon.de/', 'https://callforpapers.sandsmedia.com', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(18, 'DevOpsDays Houston', '2021-04-21', '2021-04-22', '2021-01-15', 'https://devopsdays.org/events/2021-houston/welcome/', 'https://www.papercall.io/cfps/3575/submissions/new?', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(19, 'CodeMotion Madrid', '2021-04-20', '2021-04-22', '2021-02-12', 'https://events.codemotion.com/conferences/online/2021/online-tech-conference-spanish-edition-spring/', 'https://extra.codemotion.com/onlineconfspa-spring-2021-cfp/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(20, 'stackconf', '2021-06-15', '2021-06-16', '2021-02-15', 'https://stackconf.eu/', 'https://stackconf.eu/propose/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(21, 'LibertyJS', '2021-10-07', '2021-10-08', '2021-06-02', 'https://libertyjs.com/', 'https://www.papercall.io/libertyjs-2021', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(22, 'DevOpsDays Texas', '2021-03-02', '2021-03-03', '2021-01-31', 'https://devopsdays.org/events/2021-texas/welcome/', 'https://sessionize.com/devopsdays-texas-2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(23, 'Vertmont Technology Alliance', '2021-03-01', '2021-03-05', '2021-01-22', 'https://www.vermonttechnologyalliance.org/events/EventDetails.aspx?id=1475121', 'https://sessionize.com/vtta-tech-conference/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(24, 'CodeGen', '2021-02-13', '2021-02-13', '2021-01-29', 'https://codegen2021.azurewebsites.net/', 'https://sessionize.com/codegen-2021', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(25, 'CodeMotion - Italian edition', '2021-03-23', '2021-03-25', '2021-01-29', 'https://events.codemotion.com/conferences/online/2021/online-tech-conference-italian-edition-spring/', 'https://extra.codemotion.com/onlineconf-italian-2021-cfp/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(26, 'GIDS Live', '2021-04-27', '2021-04-30', '2021-02-26', 'https://www.wurreka.com/ict/virtual-conference/gids-2021/', 'https://developersummit.wufoo.com/forms/gids-live-series-2021-call-for-proposals/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(27, 'Dutch PHP Conference', '2021-06-17', '2021-06-18', '2021-03-01', 'https://phpconference.nl/', 'https://cfp.phpconference.nl/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(28, 'Web Summer Camp', '2021-08-25', '2021-08-27', '2021-01-30', 'https://2021.websummercamp.com/', 'https://sessionize.com/web-summer-camp-2020/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(29, 'The DEVOPS Conference', '2021-03-23', '2021-03-24', '2021-01-31', 'https://www.thedevopsconference.com/', 'https://www.papercall.io/tdoc2021', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(30, 'Minnesota Developers Conference', '2021-05-04', '2021-05-04', '2021-02-28', 'https://mndevconf.com/', 'https://sessionize.com/mdc/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(31, 'CityJS', '2021-03-24', '2021-03-26', '2021-01-29', 'https://cityjsconf.org/', 'https://docs.google.com/forms/d/e/1FAIpQLSdhXejorIkVvL2T-9_R9NdMHsqbBisGxcZZKobRdDrvp5ui8w/viewform', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(32, 'Open Source 101', '2021-03-30', '2021-03-30', '2021-02-05', 'https://opensource101.com/', 'https://www.allthingsopen.org/open-source-101-cfp-now-open-through-february-5/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(33, 'OpenJS World', '2021-06-09', '2021-06-09', '2021-02-05', 'https://openjsf.org/', 'https://openjsf.org/openjs-world-2021/#call-for-papers', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(34, 'Scenic City Summit', '2021-09-24', '2021-09-24', '2021-03-31', 'http://www.sceniccitysummit.com/', 'https://sessionize.com/scenic-city-summit-2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(35, 'ScotlandPHP', '2021-10-22', '2021-10-23', '2021-05-04', 'https://scotlandphp.co.uk/', 'https://cfs.scotlandphp.co.uk/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(36, 'DevOps.js', '2021-03-29', '2021-03-30', '2021-02-15', 'https://devopsjsconf.com/', 'https://docs.google.com/forms/d/e/1FAIpQLSeFxWP04kMWRWaiA6jqNqEz2DpWekRcEwz8qCD-BEct1UmMqQ/viewform', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(37, 'ITPalooza', '2021-03-24', '2021-03-25', '2021-02-12', 'https://www.techlauderdale.org/itpalooza/', 'https://growthzonesitesprod.azureedge.net/wp-content/uploads/sites/1623/2021/02/ITP-Call-for-Speakers.pdf', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(38, 'FOSSASIA', '2021-03-13', '2021-03-21', '2021-02-11', 'https://fossasia.org/', 'https://eventyay.com/e/fa96ae2c/cfs', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(39, 'Voxxed Days AU', '2021-08-23', '2021-08-27', '2021-03-31', 'https://australia.voxxeddays.com/', 'https://australia.voxxeddays.com/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(40, 'DevOpsCon New-York', '2021-09-27', '2021-09-30', '2021-03-22', 'https://devopscon.io/new-york/', 'https://callforpapers.sandsmedia.com', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(41, 'DockerCon', '2021-05-27', '2021-05-27', '2021-03-15', 'http://docker.com/dockercon', 'https://www.papercall.io/dockercon2021', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(42, 'DevOps Pro Europe', '2021-05-11', '2021-05-13', '2021-03-01', 'https://devopspro.lt/', 'https://devopspro.lt/cfp/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(43, 'International JavaScript Conference - New-York', '2021-09-27', '2021-09-30', '2021-02-13', 'https://javascript-conference.com/new-york/', 'https://callforpapers.sandsmedia.com', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(44, 'Developer Week', '2021-02-17', '2021-02-19', '2021-02-12', 'https://www.developerweek.com/', 'https://www.developerweek.com/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(45, 'DevConf.cz', '2021-02-18', '2021-02-20', '2021-02-12', 'https://devconf.cz', 'https://devconf.cz', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(46, 'DevOps Unicorns', '2021-03-03', '2021-03-04', '2021-02-12', 'https://ninebrains.eu/events/from-software-developer-to-devops-wizard/', 'https://ninebrains.eu/events/from-software-developer-to-devops-wizard/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(47, 'The Cloud First', '2021-03-11', '2021-03-11', '2021-02-12', 'https://thecloudfirst.io/', 'https://thecloudfirst.io/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(48, 'freeCodeCamp OK', '2021-03-28', '2021-03-28', '2021-02-12', 'https://www.freecodecamp.org/', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(49, 'O\'Reilly Live Training', '2021-04-12', '2021-04-12', '2021-02-12', '', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(50, 'NDC Workshops', '2021-04-14', '2021-04-14', '2021-02-12', 'https://ndcworkshops.com/slot/docker-and-kubernetes-for-software-developers', 'https://ndcworkshops.com/slot/docker-and-kubernetes-for-software-developers', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(51, 'iJS London', '2021-04-19', '2021-04-22', '2021-02-12', 'https://javascript-conference.com/london/hybrid-conference-concept-london/', 'https://javascript-conference.com/london/hybrid-conference-concept-london/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(52, 'TEQNation', '2021-05-10', '2021-05-12', '2021-02-28', 'https://conference.teqnation.com/', 'https://sessionize.com/teqnation-2021/#', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(53, 'DevConf.us', '2021-09-02', '2021-09-03', '2021-05-31', 'https://www.devconf.info/us/', 'https://cfp.devconf.info/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(54, 'ContainerDays', '2021-07-06', '2021-07-08', '2021-04-30', 'https://www.containerdays.io/', 'https://sessionize.com/containerdays-2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(55, 'BrazilClouds Summit', '2021-05-24', '2021-05-25', '2021-02-28', 'https://www.brazilcloudsummit.com/', 'https://sessionize.com/brazilcloudssummit/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(56, 'Kafka Summit', '2021-07-27', '2021-07-28', '2021-04-05', 'https://kafka-summit.org/', 'https://sessionize.com/kafka-summit-apac-2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(57, 'iJS New-York', '2021-09-27', '2021-09-30', '2021-03-22', 'https://javascript-conference.com/', 'https://javascript-conference.com/speakers/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(58, 'DevTalks', '2021-06-09', '2021-06-11', '2021-02-26', 'https://www.devtalks.ro/', 'https://www.devtalks.ro/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(59, 'CWITC', '2021-10-09', '2021-10-09', '2021-05-01', 'https://cwitc.org/', 'https://cwitc.org/app/submit-session', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(60, 'Longhorn PHP', '2021-10-14', '2021-10-16', '2021-06-30', 'https://longhornphp.com/', 'https://cfp.longhornphp.com/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(61, 'JSNation', '2021-06-09', '2021-06-10', '2021-04-10', 'https://live.jsnation.com/', 'https://docs.google.com/forms/d/e/1FAIpQLSfor4wuiHY55rI9ivz1osSXGQ8R_UTcKuN0-ZNFfDO6VHi7uw/viewform', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(62, 'DevDays Europe', '2021-06-08', '2021-06-10', '2021-03-05', 'https://devdays.lt/', 'https://devdays.lt/call-for-papers/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(63, 'NodeDay', '2021-03-31', '2021-03-31', '2021-03-03', '', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(64, 'DeveloperWeek Europe', '2021-04-27', '2021-04-28', '2021-03-12', 'https://www.developerweek.com/europe/', 'https://sessionize.com/developerweek-europe-2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(65, '200OK', '2021-05-21', '2021-05-21', '2021-03-31', 'https://200ok.us/', 'https://www.papercall.io/cfps/3605/submissions/new', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(66, 'WorldFestival', '2021-08-17', '2021-08-19', '2021-05-06', 'https://worldfestival.com/', 'https://sessionize.com/worldfestival2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(67, 'Shift Dev', '2021-09-02', '2021-09-03', '2021-04-02', 'https://dev.shiftconf.co/', 'https://sessionize.com/shift-dev-2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(68, 'NDC Oslo', '2021-09-13', '2021-09-17', '2021-05-15', 'https://ndcoslo.com/', 'https://ndcoslo.com/cfp', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(69, 'SPA Conference', '2021-07-12', '2021-07-16', '2021-04-26', 'https://www.spaconference.org/', 'https://sessionize.com/spa2021/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(70, 'FullStack eXchange', '2021-07-21', '2021-07-22', '2021-04-23', 'https://skillsmatter.com/conferences/13253-fullstack-2021', 'https://skillsmatter.com/member/sign_in', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(71, 'Webinale', '2021-10-24', '2021-10-29', '2021-04-26', 'https://webinale.de', 'https://callforpapers.sandsmedia.com/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(72, 'TechBash', '2021-10-19', '2021-10-22', '2021-06-04', 'https://www.techbash.com/', 'https://sessionize.com/techbash-2021/#', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(73, 'DevOpsDays Boston', '2021-09-27', '2021-09-28', '2021-04-02', 'https://devopsdays.org/events/2021-boston', 'https://www.papercall.io/dodbos21', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(74, 'enterJS', '2021-09-27', '2021-09-30', '2021-05-10', 'https://enterjs.de/', 'https://enterjs.de/proposal_einreichen_en.php', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(75, 'JS World Conference', '2021-05-21', '2021-05-21', '2021-04-01', 'https://usa.jsworldconference.com/', 'https://usa.jsworldconference.com/sign-up', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(76, 'Nebraska.Code()', '2021-07-14', '2021-07-15', '2021-04-09', 'https://nebraskacode.amegala.com/', 'https://www.amegala.com/#/cfp/nebraskacode/2021', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(77, 'Prairie.Code()', '2021-09-22', '2021-09-24', '2021-04-09', 'http://prairiecode.amegala.com/', 'https://www.amegala.com/#/cfp/prairiecode/2021', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(78, 'Code PaLOUsa', '2021-08-18', '2021-08-20', '2021-04-30', 'https://www.codepalousa.com/', 'https://sessionize.com/cpl21/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(79, 'NDC Workshop', '2021-05-05', '2021-05-05', '2021-04-24', 'https://ndcworkshops.com/', 'https://ndcworkshops.com/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(80, 'iJS Munich', '2021-10-25', '2021-10-29', '2021-04-24', 'https://javascript-conference.com/munich', 'https://callforpapers.sandsmedia.com/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(81, 'DevOpsCon', '2021-11-21', '2021-11-25', '2021-04-24', 'https://devopscon.io/', 'https://callforpapers.sandsmedia.com/', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(82, 'StrangeLoop', '2021-09-30', '2021-10-02', '2021-05-06', 'https://thestrangeloop.com/', 'http://strangeloop-cfp.us-east-1.elasticbeanstalk.com/index.html', 'a515ae23-5e28-408b-ab95-72494a490afc');

-- --------------------------------------------------------

--
-- Table structure for table `cfp_ignored`
--

CREATE TABLE `cfp_ignored` (
  `id` int(11) NOT NULL,
  `cfp_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cfp_ignored`
--

INSERT INTO `cfp_ignored` (`id`, `cfp_id`, `user_id`) VALUES
(3, 14, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(4, 20, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(5, 10, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(6, 55, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(7, 70, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(8, 69, 'a515ae23-5e28-408b-ab95-72494a490afc');

-- --------------------------------------------------------

--
-- Table structure for table `cfp_submissions`
--

CREATE TABLE `cfp_submissions` (
  `id` int(11) NOT NULL,
  `cfp_id` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cfp_submissions`
--

INSERT INTO `cfp_submissions` (`id`, `cfp_id`, `talk_id`, `accepted`, `user_id`) VALUES
(1, 7, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(2, 8, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(3, 8, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(4, 8, 4, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(5, 9, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(6, 9, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(7, 12, 6, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(8, 12, 5, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(13, 11, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(14, 11, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(15, 11, 5, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(20, 15, 9, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(21, 5, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(22, 5, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(23, 5, 5, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(24, 18, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(25, 13, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(26, 13, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(27, 13, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(28, 13, 7, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(29, 12, 7, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(30, 12, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(31, 12, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(32, 12, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(33, 17, 10, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(34, 17, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(35, 16, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(36, 16, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(37, 16, 7, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(38, 16, 10, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(39, 23, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(40, 24, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(41, 24, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(42, 24, 6, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(43, 25, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(44, 25, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(45, 25, 7, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(46, 19, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(47, 19, 7, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(48, 19, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(53, 4, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(54, 4, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(55, 4, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(56, 4, 7, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(57, 4, 11, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(58, 22, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(59, 26, 10, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(60, 26, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(61, 26, 6, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(62, 6, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(63, 6, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(64, 6, 6, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(65, 6, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(66, 28, 11, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(67, 28, 7, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(68, 29, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(69, 30, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(70, 30, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(71, 30, 6, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(72, 30, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(73, 27, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(74, 27, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(75, 27, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(79, 31, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(80, 31, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(81, 33, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(82, 33, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(83, 33, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(84, 33, 8, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(88, 43, 3, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(89, 43, 13, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(90, 38, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(91, 38, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(92, 44, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(93, 45, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(94, 45, 4, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(95, 46, 11, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(96, 47, 4, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(97, 48, 9, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(98, 49, 7, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(99, 50, 11, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(100, 51, 3, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(101, 51, 9, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(102, 37, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(103, 37, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(104, 42, 11, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(105, 42, 4, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(106, 42, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(107, 41, 12, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(108, 39, 8, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(109, 39, 1, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(110, 39, 4, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(111, 39, 12, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(112, 39, 11, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(113, 34, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(114, 34, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(115, 34, 4, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(116, 32, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(117, 32, 3, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(118, 52, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(119, 52, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(120, 52, 9, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(126, 40, 4, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(127, 40, 7, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(128, 40, 10, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(129, 40, 11, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(130, 58, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(131, 59, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(132, 59, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(133, 59, 6, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(134, 59, 12, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(135, 63, 9, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(136, 62, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(137, 62, 8, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(138, 62, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(139, 36, 9, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(140, 36, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(141, 36, 12, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(142, 64, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(143, 64, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(144, 64, 4, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(145, 65, 1, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(146, 65, 8, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(147, 67, 1, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(148, 67, 8, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(149, 75, 1, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(150, 73, 4, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(151, 76, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(152, 76, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(153, 76, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(154, 76, 13, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(155, 76, 11, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(156, 77, 1, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(157, 77, 3, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(158, 77, 8, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(159, 77, 11, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(160, 77, 13, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(161, 56, 14, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(162, 57, 11, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(163, 57, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(164, 57, 6, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(165, 57, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(166, 57, 12, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(167, 57, 13, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(168, 72, 1, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(169, 72, 8, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(170, 78, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(171, 78, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(172, 78, 7, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(173, 78, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(174, 79, 7, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(175, 80, 1, 1, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(176, 80, 3, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(177, 80, 8, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(178, 80, 14, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(179, 80, 12, 0, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(180, 81, 4, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(181, 81, 7, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(182, 81, 14, NULL, 'a515ae23-5e28-408b-ab95-72494a490afc'),
(183, 82, 1, 0, 'a515ae23-5e28-408b-ab95-72494a490afc');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT`
--

CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENT`
--

INSERT INTO `CLIENT` (`ID`, `ENABLED`, `FULL_SCOPE_ALLOWED`, `CLIENT_ID`, `NOT_BEFORE`, `PUBLIC_CLIENT`, `SECRET`, `BASE_URL`, `BEARER_ONLY`, `MANAGEMENT_URL`, `SURROGATE_AUTH_REQUIRED`, `REALM_ID`, `PROTOCOL`, `NODE_REREG_TIMEOUT`, `FRONTCHANNEL_LOGOUT`, `CONSENT_REQUIRED`, `NAME`, `SERVICE_ACCOUNTS_ENABLED`, `CLIENT_AUTHENTICATOR_TYPE`, `ROOT_URL`, `DESCRIPTION`, `REGISTRATION_TOKEN`, `STANDARD_FLOW_ENABLED`, `IMPLICIT_FLOW_ENABLED`, `DIRECT_ACCESS_GRANTS_ENABLED`, `ALWAYS_DISPLAY_IN_CONSOLE`) VALUES
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', b'1', b'0', 'security-admin-console', 0, b'1', '**********', '/admin/myrealm/console/', b'0', NULL, b'0', 'myrealm', 'openid-connect', 0, b'0', b'0', '${client_security-admin-console}', b'0', 'client-secret', '${authAdminUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', b'1', b'0', 'account-console', 0, b'1', 'b02c5384-48cd-41d8-90b3-27476963f3e0', '/realms/master/account/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_account-console}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', b'1', b'0', 'account', 0, b'0', 'c17b91dd-4229-4c5c-924f-3201139b7e20', '/realms/master/account/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_account}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('158426be-09fc-4baa-942b-520fb38fc411', b'1', b'0', 'admin-cli', 0, b'1', '**********', NULL, b'0', NULL, b'0', 'myrealm', 'openid-connect', 0, b'0', b'0', '${client_admin-cli}', b'0', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'1', b'0'),
('37b72042-6743-430a-969e-93b37410e404', b'1', b'0', 'account', 0, b'0', '**********', '/realms/myrealm/account/', b'0', NULL, b'0', 'myrealm', 'openid-connect', 0, b'0', b'0', '${client_account}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', b'1', b'0', 'broker', 0, b'0', 'fe73bd88-0b24-4eaf-832d-d67f4ea5e303', NULL, b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_broker}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', b'1', b'1', 'myclient', 0, b'1', '**********', NULL, b'0', 'http://localhost:3000', b'0', 'myrealm', 'openid-connect', -1, b'0', b'0', NULL, b'0', 'client-secret', 'http://localhost:3000', NULL, NULL, b'1', b'0', b'1', b'0'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', b'1', b'0', 'admin-cli', 0, b'1', '4cfd6e8b-ac1c-4d6a-b8d5-0fe3596f55f4', NULL, b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_admin-cli}', b'0', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'1', b'0'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', b'1', b'0', 'broker', 0, b'0', '**********', NULL, b'0', NULL, b'0', 'myrealm', 'openid-connect', 0, b'0', b'0', '${client_broker}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', b'0', 'realm-management', 0, b'0', '**********', NULL, b'1', NULL, b'0', 'myrealm', 'openid-connect', 0, b'0', b'0', '${client_realm-management}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', b'1', 'master-realm', 0, b'0', 'e57ed73b-f1ce-491b-ba0b-491a3c7c531b', NULL, b'1', NULL, b'0', 'master', NULL, 0, b'0', b'0', 'master Realm', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', b'1', 'myrealm-realm', 0, b'0', '4d811695-5e28-4379-a6aa-ecfb9b0b18d5', NULL, b'1', NULL, b'0', 'master', NULL, 0, b'0', b'0', 'myrealm Realm', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', b'1', b'0', 'account-console', 0, b'1', '**********', '/realms/myrealm/account/', b'0', NULL, b'0', 'myrealm', 'openid-connect', 0, b'0', b'0', '${client_account-console}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('e05b255a-e287-427b-8837-13b3380af674', b'1', b'0', 'security-admin-console', 0, b'1', '2d3db37f-5996-49a0-8009-54fca3c2f241', '/admin/master/console/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_security-admin-console}', b'0', 'client-secret', '${authAdminUrl}', NULL, NULL, b'1', b'0', b'0', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

INSERT INTO `CLIENT_ATTRIBUTES` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', 'S256', 'pkce.code.challenge.method'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', 'S256', 'pkce.code.challenge.method'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'backchannel.logout.revoke.offline.tokens'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'true', 'backchannel.logout.session.required'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'client_credentials.use_refresh_token'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'display.on.consent.screen'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'exclude.session.state.from.auth.response'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.assertion.signature'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.authnstatement'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.client.signature'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.encrypt'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.force.post.binding'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.multivalued.roles'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.onetimeuse.condition'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.server.signature'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml.server.signature.keyinfo.ext'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'saml_force_name_id_format'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'false', 'tls.client.certificate.bound.access.tokens'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', 'S256', 'pkce.code.challenge.method'),
('e05b255a-e287-427b-8837-13b3380af674', 'S256', 'pkce.code.challenge.method');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

INSERT INTO `CLIENT_DEFAULT_ROLES` (`CLIENT_ID`, `ROLE_ID`) VALUES
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '1b7483bd-5613-4d5b-95ad-5b6e72c4050b'),
('37b72042-6743-430a-969e-93b37410e404', '931003d6-4178-49ce-8dbd-a4414a82983d'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '97d6871f-dee1-4ad2-b08f-f7c7b8b62f15'),
('37b72042-6743-430a-969e-93b37410e404', 'f7cde267-aed9-46b3-aa11-6a01c3ef9ce7');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SCOPE`
--

CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENT_SCOPE`
--

INSERT INTO `CLIENT_SCOPE` (`ID`, `NAME`, `REALM_ID`, `DESCRIPTION`, `PROTOCOL`) VALUES
('06a10ec3-0003-4796-ab20-effabe78b1fc', 'offline_access', 'myrealm', 'OpenID Connect built-in scope: offline_access', 'openid-connect'),
('090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect'),
('0c4051b3-5e22-47c6-878f-34c9dd8d6294', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect'),
('0ffff138-7bd7-4872-813f-96e3d060e024', 'role_list', 'myrealm', 'SAML role list', 'saml'),
('135c27f2-629b-4542-8b29-4c2b896eabe3', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect'),
('23e7aeec-d9c8-4034-9562-976d789a4fcc', 'address', 'myrealm', 'OpenID Connect built-in scope: address', 'openid-connect'),
('2b5ee063-bcbb-4132-b43c-9291d7022a95', 'profile', 'myrealm', 'OpenID Connect built-in scope: profile', 'openid-connect'),
('59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', 'web-origins', 'myrealm', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect'),
('6543c8d5-09c4-4a49-bb69-474bb79e712b', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect'),
('6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect'),
('83b587df-db27-499f-8bd6-2666abd8148e', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect'),
('87413bf1-a276-471f-9130-13ae27eb3f76', 'phone', 'myrealm', 'OpenID Connect built-in scope: phone', 'openid-connect'),
('a2280cb2-b9de-4c81-88f7-28b7903cbafc', 'email', 'myrealm', 'OpenID Connect built-in scope: email', 'openid-connect'),
('b01caa13-d061-4501-af1a-d61290f7c2fb', 'role_list', 'master', 'SAML role list', 'saml'),
('b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', 'microprofile-jwt', 'myrealm', 'Microprofile - JWT built-in scope', 'openid-connect'),
('ba260e12-abf6-4b57-ab38-a3b0e83ee109', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect'),
('d7dde753-b227-400d-af3e-993ebaedae54', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect'),
('e3206894-28bb-4261-9a13-f1656e96dc56', 'roles', 'myrealm', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` (`SCOPE_ID`, `VALUE`, `NAME`) VALUES
('06a10ec3-0003-4796-ab20-effabe78b1fc', '${offlineAccessScopeConsentText}', 'consent.screen.text'),
('06a10ec3-0003-4796-ab20-effabe78b1fc', 'true', 'display.on.consent.screen'),
('090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', '${emailScopeConsentText}', 'consent.screen.text'),
('090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', 'true', 'display.on.consent.screen'),
('090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', 'true', 'include.in.token.scope'),
('0c4051b3-5e22-47c6-878f-34c9dd8d6294', '${rolesScopeConsentText}', 'consent.screen.text'),
('0c4051b3-5e22-47c6-878f-34c9dd8d6294', 'true', 'display.on.consent.screen'),
('0c4051b3-5e22-47c6-878f-34c9dd8d6294', 'false', 'include.in.token.scope'),
('0ffff138-7bd7-4872-813f-96e3d060e024', '${samlRoleListScopeConsentText}', 'consent.screen.text'),
('0ffff138-7bd7-4872-813f-96e3d060e024', 'true', 'display.on.consent.screen'),
('135c27f2-629b-4542-8b29-4c2b896eabe3', '${phoneScopeConsentText}', 'consent.screen.text'),
('135c27f2-629b-4542-8b29-4c2b896eabe3', 'true', 'display.on.consent.screen'),
('135c27f2-629b-4542-8b29-4c2b896eabe3', 'true', 'include.in.token.scope'),
('23e7aeec-d9c8-4034-9562-976d789a4fcc', '${addressScopeConsentText}', 'consent.screen.text'),
('23e7aeec-d9c8-4034-9562-976d789a4fcc', 'true', 'display.on.consent.screen'),
('23e7aeec-d9c8-4034-9562-976d789a4fcc', 'true', 'include.in.token.scope'),
('2b5ee063-bcbb-4132-b43c-9291d7022a95', '${profileScopeConsentText}', 'consent.screen.text'),
('2b5ee063-bcbb-4132-b43c-9291d7022a95', 'true', 'display.on.consent.screen'),
('2b5ee063-bcbb-4132-b43c-9291d7022a95', 'true', 'include.in.token.scope'),
('59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', '', 'consent.screen.text'),
('59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', 'false', 'display.on.consent.screen'),
('59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', 'false', 'include.in.token.scope'),
('6543c8d5-09c4-4a49-bb69-474bb79e712b', '${profileScopeConsentText}', 'consent.screen.text'),
('6543c8d5-09c4-4a49-bb69-474bb79e712b', 'true', 'display.on.consent.screen'),
('6543c8d5-09c4-4a49-bb69-474bb79e712b', 'true', 'include.in.token.scope'),
('6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', 'false', 'display.on.consent.screen'),
('6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', 'true', 'include.in.token.scope'),
('83b587df-db27-499f-8bd6-2666abd8148e', '${addressScopeConsentText}', 'consent.screen.text'),
('83b587df-db27-499f-8bd6-2666abd8148e', 'true', 'display.on.consent.screen'),
('83b587df-db27-499f-8bd6-2666abd8148e', 'true', 'include.in.token.scope'),
('87413bf1-a276-471f-9130-13ae27eb3f76', '${phoneScopeConsentText}', 'consent.screen.text'),
('87413bf1-a276-471f-9130-13ae27eb3f76', 'true', 'display.on.consent.screen'),
('87413bf1-a276-471f-9130-13ae27eb3f76', 'true', 'include.in.token.scope'),
('a2280cb2-b9de-4c81-88f7-28b7903cbafc', '${emailScopeConsentText}', 'consent.screen.text'),
('a2280cb2-b9de-4c81-88f7-28b7903cbafc', 'true', 'display.on.consent.screen'),
('a2280cb2-b9de-4c81-88f7-28b7903cbafc', 'true', 'include.in.token.scope'),
('b01caa13-d061-4501-af1a-d61290f7c2fb', '${samlRoleListScopeConsentText}', 'consent.screen.text'),
('b01caa13-d061-4501-af1a-d61290f7c2fb', 'true', 'display.on.consent.screen'),
('b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', 'false', 'display.on.consent.screen'),
('b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', 'true', 'include.in.token.scope'),
('ba260e12-abf6-4b57-ab38-a3b0e83ee109', '${offlineAccessScopeConsentText}', 'consent.screen.text'),
('ba260e12-abf6-4b57-ab38-a3b0e83ee109', 'true', 'display.on.consent.screen'),
('d7dde753-b227-400d-af3e-993ebaedae54', '', 'consent.screen.text'),
('d7dde753-b227-400d-af3e-993ebaedae54', 'false', 'display.on.consent.screen'),
('d7dde753-b227-400d-af3e-993ebaedae54', 'false', 'include.in.token.scope'),
('e3206894-28bb-4261-9a13-f1656e96dc56', '${rolesScopeConsentText}', 'consent.screen.text'),
('e3206894-28bb-4261-9a13-f1656e96dc56', 'true', 'display.on.consent.screen'),
('e3206894-28bb-4261-9a13-f1656e96dc56', 'false', 'include.in.token.scope');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

INSERT INTO `CLIENT_SCOPE_CLIENT` (`CLIENT_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`) VALUES
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', '06a10ec3-0003-4796-ab20-effabe78b1fc', b'0'),
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', '0ffff138-7bd7-4872-813f-96e3d060e024', b'1'),
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', '23e7aeec-d9c8-4034-9562-976d789a4fcc', b'0'),
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', '2b5ee063-bcbb-4132-b43c-9291d7022a95', b'1'),
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', b'1'),
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', '87413bf1-a276-471f-9130-13ae27eb3f76', b'0'),
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', 'a2280cb2-b9de-4c81-88f7-28b7903cbafc', b'1'),
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', b'0'),
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', 'e3206894-28bb-4261-9a13-f1656e96dc56', b'1'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', b'1'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', '0c4051b3-5e22-47c6-878f-34c9dd8d6294', b'1'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', '135c27f2-629b-4542-8b29-4c2b896eabe3', b'0'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', '6543c8d5-09c4-4a49-bb69-474bb79e712b', b'1'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', b'0'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', '83b587df-db27-499f-8bd6-2666abd8148e', b'0'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', 'b01caa13-d061-4501-af1a-d61290f7c2fb', b'1'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', 'ba260e12-abf6-4b57-ab38-a3b0e83ee109', b'0'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', 'd7dde753-b227-400d-af3e-993ebaedae54', b'1'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', b'1'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '0c4051b3-5e22-47c6-878f-34c9dd8d6294', b'1'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '135c27f2-629b-4542-8b29-4c2b896eabe3', b'0'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '6543c8d5-09c4-4a49-bb69-474bb79e712b', b'1'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', b'0'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '83b587df-db27-499f-8bd6-2666abd8148e', b'0'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', 'b01caa13-d061-4501-af1a-d61290f7c2fb', b'1'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', 'ba260e12-abf6-4b57-ab38-a3b0e83ee109', b'0'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', 'd7dde753-b227-400d-af3e-993ebaedae54', b'1'),
('158426be-09fc-4baa-942b-520fb38fc411', '06a10ec3-0003-4796-ab20-effabe78b1fc', b'0'),
('158426be-09fc-4baa-942b-520fb38fc411', '0ffff138-7bd7-4872-813f-96e3d060e024', b'1'),
('158426be-09fc-4baa-942b-520fb38fc411', '23e7aeec-d9c8-4034-9562-976d789a4fcc', b'0'),
('158426be-09fc-4baa-942b-520fb38fc411', '2b5ee063-bcbb-4132-b43c-9291d7022a95', b'1'),
('158426be-09fc-4baa-942b-520fb38fc411', '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', b'1'),
('158426be-09fc-4baa-942b-520fb38fc411', '87413bf1-a276-471f-9130-13ae27eb3f76', b'0'),
('158426be-09fc-4baa-942b-520fb38fc411', 'a2280cb2-b9de-4c81-88f7-28b7903cbafc', b'1'),
('158426be-09fc-4baa-942b-520fb38fc411', 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', b'0'),
('158426be-09fc-4baa-942b-520fb38fc411', 'e3206894-28bb-4261-9a13-f1656e96dc56', b'1'),
('37b72042-6743-430a-969e-93b37410e404', '06a10ec3-0003-4796-ab20-effabe78b1fc', b'0'),
('37b72042-6743-430a-969e-93b37410e404', '0ffff138-7bd7-4872-813f-96e3d060e024', b'1'),
('37b72042-6743-430a-969e-93b37410e404', '23e7aeec-d9c8-4034-9562-976d789a4fcc', b'0'),
('37b72042-6743-430a-969e-93b37410e404', '2b5ee063-bcbb-4132-b43c-9291d7022a95', b'1'),
('37b72042-6743-430a-969e-93b37410e404', '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', b'1'),
('37b72042-6743-430a-969e-93b37410e404', '87413bf1-a276-471f-9130-13ae27eb3f76', b'0'),
('37b72042-6743-430a-969e-93b37410e404', 'a2280cb2-b9de-4c81-88f7-28b7903cbafc', b'1'),
('37b72042-6743-430a-969e-93b37410e404', 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', b'0'),
('37b72042-6743-430a-969e-93b37410e404', 'e3206894-28bb-4261-9a13-f1656e96dc56', b'1'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', b'1'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', '0c4051b3-5e22-47c6-878f-34c9dd8d6294', b'1'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', '135c27f2-629b-4542-8b29-4c2b896eabe3', b'0'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', '6543c8d5-09c4-4a49-bb69-474bb79e712b', b'1'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', b'0'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', '83b587df-db27-499f-8bd6-2666abd8148e', b'0'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', 'b01caa13-d061-4501-af1a-d61290f7c2fb', b'1'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', 'ba260e12-abf6-4b57-ab38-a3b0e83ee109', b'0'),
('3a58ead6-8521-4849-aae4-8fa354f3bfaa', 'd7dde753-b227-400d-af3e-993ebaedae54', b'1'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', '06a10ec3-0003-4796-ab20-effabe78b1fc', b'0'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', '0ffff138-7bd7-4872-813f-96e3d060e024', b'1'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', '23e7aeec-d9c8-4034-9562-976d789a4fcc', b'0'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', '2b5ee063-bcbb-4132-b43c-9291d7022a95', b'1'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', b'1'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', '87413bf1-a276-471f-9130-13ae27eb3f76', b'0'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'a2280cb2-b9de-4c81-88f7-28b7903cbafc', b'1'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', b'0'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'e3206894-28bb-4261-9a13-f1656e96dc56', b'1'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', b'1'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', '0c4051b3-5e22-47c6-878f-34c9dd8d6294', b'1'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', '135c27f2-629b-4542-8b29-4c2b896eabe3', b'0'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', '6543c8d5-09c4-4a49-bb69-474bb79e712b', b'1'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', b'0'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', '83b587df-db27-499f-8bd6-2666abd8148e', b'0'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', 'b01caa13-d061-4501-af1a-d61290f7c2fb', b'1'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', 'ba260e12-abf6-4b57-ab38-a3b0e83ee109', b'0'),
('4f48d285-e67f-44ad-aca4-5788961d64c1', 'd7dde753-b227-400d-af3e-993ebaedae54', b'1'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', '06a10ec3-0003-4796-ab20-effabe78b1fc', b'0'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', '0ffff138-7bd7-4872-813f-96e3d060e024', b'1'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', '23e7aeec-d9c8-4034-9562-976d789a4fcc', b'0'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', '2b5ee063-bcbb-4132-b43c-9291d7022a95', b'1'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', b'1'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', '87413bf1-a276-471f-9130-13ae27eb3f76', b'0'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', 'a2280cb2-b9de-4c81-88f7-28b7903cbafc', b'1'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', b'0'),
('6469b17a-412a-4b1f-ab11-80cc86ee8b2e', 'e3206894-28bb-4261-9a13-f1656e96dc56', b'1'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', '06a10ec3-0003-4796-ab20-effabe78b1fc', b'0'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', '0ffff138-7bd7-4872-813f-96e3d060e024', b'1'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', '23e7aeec-d9c8-4034-9562-976d789a4fcc', b'0'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', '2b5ee063-bcbb-4132-b43c-9291d7022a95', b'1'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', b'1'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', '87413bf1-a276-471f-9130-13ae27eb3f76', b'0'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', 'a2280cb2-b9de-4c81-88f7-28b7903cbafc', b'1'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', b'0'),
('a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', 'e3206894-28bb-4261-9a13-f1656e96dc56', b'1'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', b'1'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', '0c4051b3-5e22-47c6-878f-34c9dd8d6294', b'1'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', '135c27f2-629b-4542-8b29-4c2b896eabe3', b'0'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', '6543c8d5-09c4-4a49-bb69-474bb79e712b', b'1'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', b'0'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', '83b587df-db27-499f-8bd6-2666abd8148e', b'0'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', 'b01caa13-d061-4501-af1a-d61290f7c2fb', b'1'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', 'ba260e12-abf6-4b57-ab38-a3b0e83ee109', b'0'),
('bc72954a-b973-4654-9a9d-f7e8db39498c', 'd7dde753-b227-400d-af3e-993ebaedae54', b'1'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', b'1'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', '0c4051b3-5e22-47c6-878f-34c9dd8d6294', b'1'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', '135c27f2-629b-4542-8b29-4c2b896eabe3', b'0'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', '6543c8d5-09c4-4a49-bb69-474bb79e712b', b'1'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', b'0'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', '83b587df-db27-499f-8bd6-2666abd8148e', b'0'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', 'b01caa13-d061-4501-af1a-d61290f7c2fb', b'1'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', 'ba260e12-abf6-4b57-ab38-a3b0e83ee109', b'0'),
('ca7bf392-db45-4f3b-91ec-89745a6b9347', 'd7dde753-b227-400d-af3e-993ebaedae54', b'1'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', '06a10ec3-0003-4796-ab20-effabe78b1fc', b'0'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', '0ffff138-7bd7-4872-813f-96e3d060e024', b'1'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', '23e7aeec-d9c8-4034-9562-976d789a4fcc', b'0'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', '2b5ee063-bcbb-4132-b43c-9291d7022a95', b'1'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', b'1'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', '87413bf1-a276-471f-9130-13ae27eb3f76', b'0'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', 'a2280cb2-b9de-4c81-88f7-28b7903cbafc', b'1'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', b'0'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', 'e3206894-28bb-4261-9a13-f1656e96dc56', b'1'),
('e05b255a-e287-427b-8837-13b3380af674', '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', b'1'),
('e05b255a-e287-427b-8837-13b3380af674', '0c4051b3-5e22-47c6-878f-34c9dd8d6294', b'1'),
('e05b255a-e287-427b-8837-13b3380af674', '135c27f2-629b-4542-8b29-4c2b896eabe3', b'0'),
('e05b255a-e287-427b-8837-13b3380af674', '6543c8d5-09c4-4a49-bb69-474bb79e712b', b'1'),
('e05b255a-e287-427b-8837-13b3380af674', '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', b'0'),
('e05b255a-e287-427b-8837-13b3380af674', '83b587df-db27-499f-8bd6-2666abd8148e', b'0'),
('e05b255a-e287-427b-8837-13b3380af674', 'b01caa13-d061-4501-af1a-d61290f7c2fb', b'1'),
('e05b255a-e287-427b-8837-13b3380af674', 'ba260e12-abf6-4b57-ab38-a3b0e83ee109', b'0'),
('e05b255a-e287-427b-8837-13b3380af674', 'd7dde753-b227-400d-af3e-993ebaedae54', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` (`SCOPE_ID`, `ROLE_ID`) VALUES
('06a10ec3-0003-4796-ab20-effabe78b1fc', 'a218f51c-cb1a-43e7-b30f-530351bd0820'),
('ba260e12-abf6-4b57-ab38-a3b0e83ee109', '195d9b4a-8781-484b-860b-e1371a25c2c4');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION`
--

CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `COMPONENT`
--

CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `COMPONENT`
--

INSERT INTO `COMPONENT` (`ID`, `NAME`, `PARENT_ID`, `PROVIDER_ID`, `PROVIDER_TYPE`, `REALM_ID`, `SUB_TYPE`) VALUES
('0c198751-63a8-4964-b170-9b39c4b7e48c', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('13095a83-6b45-4e4a-bff1-dd25006f1ba0', 'Consent Required', 'myrealm', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'myrealm', 'anonymous'),
('165c48a1-69f5-4acf-8c87-d686e16cbb8e', 'Max Clients Limit', 'myrealm', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'myrealm', 'anonymous'),
('1c91bf56-2ae0-49c8-ad5c-30b82489455d', 'Allowed Client Scopes', 'myrealm', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'myrealm', 'authenticated'),
('264cd633-9bb4-4563-a4cf-6aed66da5191', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated'),
('35cb84fd-5bf0-455e-9245-fab401afb475', 'Full Scope Disabled', 'myrealm', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'myrealm', 'anonymous'),
('5f63813f-11b8-4a23-945b-4ed4f3467528', 'aes-generated', 'myrealm', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'myrealm', NULL),
('613a4a6b-6181-4a58-82ac-7fee3c067229', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated'),
('70dea281-d223-4dda-bf77-733df657d511', 'fallback-HS256', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('807bc4a8-fc79-48a6-bce1-24f269de67b7', 'Allowed Client Scopes', 'myrealm', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'myrealm', 'anonymous'),
('822ed111-6e7a-47ff-a134-011d52a3451a', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('840b3ad2-609b-4521-bf93-f3daa2acb91d', 'Allowed Protocol Mapper Types', 'myrealm', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'myrealm', 'anonymous'),
('a4336b05-9af7-464b-af28-bdb7b8a6a6f4', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('ab15c7ed-df30-4d4c-8efe-ca565d61aae8', 'Trusted Hosts', 'myrealm', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'myrealm', 'anonymous'),
('ac1cab2b-78d7-4dce-b203-f3e9705ce0e2', 'fallback-RS256', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('b17d8c1c-74a5-40b5-b525-053db3b8e348', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('c4b7b008-f96b-4030-81c4-97615d92973d', 'rsa-generated', 'myrealm', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'myrealm', NULL),
('d1d1a92b-9b6c-4a35-839d-59b6628067e0', 'Allowed Protocol Mapper Types', 'myrealm', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'myrealm', 'authenticated'),
('daa6a8e9-b70c-4fe4-924f-cfbe67747fbb', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('dad830af-2ea4-4519-8ff7-b41dd86cfc88', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('f9bca48b-29d0-477b-b8ed-43871397b2a5', 'hmac-generated', 'myrealm', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'myrealm', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `COMPONENT_CONFIG`
--

CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

INSERT INTO `COMPONENT_CONFIG` (`ID`, `COMPONENT_ID`, `NAME`, `VALUE`) VALUES
('037c6d36-f56b-4557-ab04-71864b330cc6', 'ac1cab2b-78d7-4dce-b203-f3e9705ce0e2', 'certificate', 'MIICmzCCAYMCBgF281cEyDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwMTExMjEyMzU1WhcNMzEwMTExMjEyNTM1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCLGqXcY/ULuUgsuQm75am5J10UcGefThA07zMrW6vKie3olHbv4W3d7T1u7UqVI9rj8vSirGM+pkJDfb4vL1omCyR8VHXume3u9v7s95FtG5Dw0+oPUC0zlWshYeXVv1eC7RWLfGjP0H/ryeB7MJH39UufLnx8Tsky+I3ibiqlwsVdXiI4YOFnpBll4aEzOkcNjdlIn1zhGRc82MNnO7vX8rheD9u9pwXP5BVHlErQBot6bHx96To3dRTAUfJu+yBMcEDFbs6P0eyPTYXD20Otrxsz+CzR20qf0wXiLBrZuXk0ewToq/UBBU125i5K5cyZYQf6TK37CR96+BsYY6LJAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAJOF7bsAk/+8f+dG1+VxgpJDEU6BDW4Nd2dWS9eBPsvtdezmANQBbobKBVhAxyXd50dsnFXsNlz5irD4OpRL3SkJFs4SuboEzE4DcxQ4InEc7G6E8wDGICDoMhrQaZa4SyGrhTbK0xEDrv1qn9VsFFHLCT2icTzHpd4EExDDIRyj7laqrRnA6eUo2QNpb1Fgw+8hJ2dP84MYaGt2gpDlbWha2x9o/c90/rSQJcu1S/MUTyhtqPQdFEmVJYxq9ukr2oypcrpynvdEDPBl2qpTONsiSkUQlLVuN6R6O5freofD2BblM80TuLNozfUmUdNbETQzr34ZWOk2rrBjwON+9I='),
('06dc91d1-b88b-4acd-8f6c-e333323f98e2', '70dea281-d223-4dda-bf77-733df657d511', 'secret', 'Rllzyf0_Ye6bWrWWS_PEtTNj45r9V7wDqbm3sIFwBfNX-nKM72sMZ0rnmRD5HiTr372RWl4x5GnVjbvL14Nx1A'),
('0d6bae87-1e89-4817-b6d2-9bf93d2e533a', '264cd633-9bb4-4563-a4cf-6aed66da5191', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('13756c6c-8597-4ae2-97bd-0e979e5a93e5', '840b3ad2-609b-4521-bf93-f3daa2acb91d', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('1680dba4-c757-4c03-abed-f2405ddcd836', '840b3ad2-609b-4521-bf93-f3daa2acb91d', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('19692118-9d66-4711-b6e2-facef0d83703', '1c91bf56-2ae0-49c8-ad5c-30b82489455d', 'allow-default-scopes', 'true'),
('1a7786e1-7440-4760-ab0b-fb317747299a', '807bc4a8-fc79-48a6-bce1-24f269de67b7', 'allow-default-scopes', 'true'),
('27827e71-3213-4fa2-ac93-727bc7a3229e', '822ed111-6e7a-47ff-a134-011d52a3451a', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('27df2595-c144-42be-a087-864104d5dbd0', 'c4b7b008-f96b-4030-81c4-97615d92973d', 'certificate', 'MIICnTCCAYUCBgF281bGSzANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdteXJlYWxtMB4XDTIxMDExMTIxMjMzOVoXDTMxMDExMTIxMjUxOVowEjEQMA4GA1UEAwwHbXlyZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAICB4269yYjdfInpWacyVUhWSism81z0e/lrmNACPaDpk6MecS3RzGEpXVnQlj8D54AA8WNOCEjlK84jsZtMhowtx4IS04oXCsZ20DEN8rQTTvYQXb7bAkBTUqI96i4AyZra3wKbKQ0Hus4vyM7IFYgvcjwbb0CwAE/gU1sreVzjyziHx39yoVxdXMh8u3ukYnikRXwcKuUk7PeUYC6U+slC4KOsK8gZymiUx4QwMU78p10gPOom4Y5S6Mh5xvPxJZGs3iDmpLKEKqw35X3h/HH9E3Xa/MITZOKzPpE6QYH3biEaNNAu0znrgRvL5XJgbKuDmPgPZFSycy+N3vkQwx0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAW9weC3a/uMXtgmpBsewv/yAviuFSbXklDUysyqeKx2We2iMdwVcamC4gO1y+Ele4e/PCwQhZWPuWKIw69dD9dTGa9UC9i/I5TmTV9AzG/0BlSZxWfqDv+EMWu2DpLxmb26KpeI3ESkXEdAxsXlpjnNsRlyonHTVbVlmCRG1Sh16UlRzaIfWTmbXIf8VAxvvvemjy7HDkwB8rledJcCbI3AF+gcVzRwWjEef9WZyGJd2WW0pRxO5LPNrYQ+qR7zMXqQUAcR/4GDppwO8ZADxPGsT3G9VaFNzKVUT2Ta/X1VFUEtvWPo0fckHpLM/qCBf4xdcwoS2k+ubTt/dQI6+xaQ=='),
('290e9e74-683c-4d4a-a460-a168d803e44a', 'd1d1a92b-9b6c-4a35-839d-59b6628067e0', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('2a951971-8611-4db3-a78c-e2ea3b9eaa12', '70dea281-d223-4dda-bf77-733df657d511', 'algorithm', 'HS256'),
('2c99f0e6-ba9b-4b68-87f2-648c68ecf67b', 'f9bca48b-29d0-477b-b8ed-43871397b2a5', 'algorithm', 'HS256'),
('401bb8b4-8ff4-4413-a26c-38a4107b6d0a', '5f63813f-11b8-4a23-945b-4ed4f3467528', 'priority', '100'),
('46f6350a-3802-4d95-b8f8-f8bf6399fab4', 'd1d1a92b-9b6c-4a35-839d-59b6628067e0', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('4c601e28-a74d-4354-b41c-61bf1172197e', 'f9bca48b-29d0-477b-b8ed-43871397b2a5', 'priority', '100'),
('53aca486-c5d5-460b-bb44-1008d84163e5', '840b3ad2-609b-4521-bf93-f3daa2acb91d', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('5e1f3efd-e82b-442b-9862-7b337f39fa47', '822ed111-6e7a-47ff-a134-011d52a3451a', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('604345ff-ab4f-4cc5-9d7e-5c55307d28fc', '840b3ad2-609b-4521-bf93-f3daa2acb91d', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('632091e7-2f32-4de6-89c9-b76903939c3b', '264cd633-9bb4-4563-a4cf-6aed66da5191', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('66402ee8-4ccb-476b-b85d-1293bb30a2d5', '264cd633-9bb4-4563-a4cf-6aed66da5191', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('66ce470c-35a0-49ec-837f-cda2d1332a30', '822ed111-6e7a-47ff-a134-011d52a3451a', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('6a42c530-d23a-4de9-9454-573fd2600198', 'd1d1a92b-9b6c-4a35-839d-59b6628067e0', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('6db72c8d-c613-496f-b819-f73aba22b94c', 'ab15c7ed-df30-4d4c-8efe-ca565d61aae8', 'client-uris-must-match', 'true'),
('73d66b2c-7f8f-4f7b-9f9f-a0c436249b8d', '264cd633-9bb4-4563-a4cf-6aed66da5191', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('749c3c30-9b88-4e4a-9950-6ee521dc0cf3', '264cd633-9bb4-4563-a4cf-6aed66da5191', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('75c73404-d22a-4c5a-8779-711537f53df4', '822ed111-6e7a-47ff-a134-011d52a3451a', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('79b38271-82df-4918-9ad4-d3df5a578a58', '0c198751-63a8-4964-b170-9b39c4b7e48c', 'host-sending-registration-request-must-match', 'true'),
('8093b22f-d934-497a-a570-1e3b9eac08ff', 'ac1cab2b-78d7-4dce-b203-f3e9705ce0e2', 'privateKey', 'MIIEowIBAAKCAQEAixql3GP1C7lILLkJu+WpuSddFHBnn04QNO8zK1uryont6JR27+Ft3e09bu1KlSPa4/L0oqxjPqZCQ32+Ly9aJgskfFR17pnt7vb+7PeRbRuQ8NPqD1AtM5VrIWHl1b9Xgu0Vi3xoz9B/68ngezCR9/VLny58fE7JMviN4m4qpcLFXV4iOGDhZ6QZZeGhMzpHDY3ZSJ9c4RkXPNjDZzu71/K4Xg/bvacFz+QVR5RK0AaLemx8fek6N3UUwFHybvsgTHBAxW7Oj9Hsj02Fw9tDra8bM/gs0dtKn9MF4iwa2bl5NHsE6Kv1AQVNduYuSuXMmWEH+kyt+wkfevgbGGOiyQIDAQABAoIBAGTfhSmmHtxKl0k/QgzNBeAr6Hba8Hn4nQ4V7BBkINb2YN0JVJqt6gNGeAdJ8ozmfGRTGg4hXrLe1CynMdR7zS7LY8D5arAFViK1YLYs7XumwtuxgQlrxeujThXeLVJsuCRMkxQcutEAzNMLCUusNB4Q9q7PghyO8Z6R2io6Y5jh60f67y4ojCjoS9nlbaZCv8+QXtaQ8bo7JZUjPtUpXugll7agEgn0nNNFeroXa8vYo0NaMGN2d6KtNVdFlcsDEtxD7ar5VvuP09DzUchYZ7dhcBGeDjBMj+R6JSEh8kATRWmtNFzHlIgr4x3QkDROIu/0jnfXDrNfrdPSUCjctoECgYEA0BL8kyPh+R+rSqVjyL7GD/VLhaXzb/dsMk7aPWLg77Lx0qvaCaYXtuWbXq1hp3Xkagw/ztStFMidxoAxznrEAGszzSDnSynOt1xf8Ht16JndUf7xg8RX04UhgAZdX9btXgAcPxENi0jpSEW0F4Y86hJPY6grHjX1mIOiqbcvyBkCgYEAqyTeDHQdjCrLoDR243CfNgKm/XMWUhxSO5U+sdcroxW1SSdjDzmP6Ei/dNQSMIjRJbO4DxzVPqcGRu1uJj7WT6hRERba9pvC7VDAzjHGwxQSYrA2XvEGYu+9fR1XSl7tc8sjjqrA+NJrwdQW3sI2W7XYBMsbVk2HT9pN7bqzxjECgYBKK0pvJK5LQDetzxCnoSE21QhLpqEE+1xM/oCauyFVMCM1Jl79a4AuiN/+Oq2BpOt7xcwE7RiZPP3IoS+f23D8eToo15660zdFcx8buNaJyDb1IHx0rMtlsaIEYcBtBk7sX/uxm2GJkb7eLUKJ1CbohQhZjLt59GAMMngMKSlWGQKBgDi6SKvCFUUvrj0VBs9Otkc1y9o4uo5O+ubrClPyaXFuMZ/k4U3bm5q3+lYkMT9LKmAf2QORYBGbVVZPPvKIY4sV1IEgnUWezZbR7IasMyDYV1vE4tDHfYFvy9Rb1GI/Yt+91rRkXwBa5wLhZQ9DOrddaBP2qsIJgq9yQeBpwUsRAoGBAMe3UuFKhhZBgFK1pw976Ys15mtsy3Sx3g7jg3cd8m1K8DgzeUsFPqZ/wRp2vruBeeyMsJOqLVn7He+0QyAAMspYrTY46bL4M8RG008N1p3+ZbWtUvqKkpM+eO5PravPgRqJbDIF4nz20WDhTRY4bEShH5z4qyTIMej/s0RjDvq8'),
('847b6d58-cd81-4c10-97fc-68c70860ded6', '840b3ad2-609b-4521-bf93-f3daa2acb91d', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('8ec755e0-9445-4b77-9e52-76ddaff97cfd', 'a4336b05-9af7-464b-af28-bdb7b8a6a6f4', 'allow-default-scopes', 'true'),
('9019ff5d-30b3-4c27-8e04-42aeee139f7c', '5f63813f-11b8-4a23-945b-4ed4f3467528', 'secret', '7Z0SUoQB_lZSM3DWKp2qdg'),
('92989b77-5611-41c1-badf-48b9856b902e', '70dea281-d223-4dda-bf77-733df657d511', 'priority', '-100'),
('95a28503-b2a7-4453-8928-81e0e26feea1', 'c4b7b008-f96b-4030-81c4-97615d92973d', 'privateKey', 'MIIEpAIBAAKCAQEAgIHjbr3JiN18ielZpzJVSFZKKybzXPR7+WuY0AI9oOmTox5xLdHMYSldWdCWPwPngADxY04ISOUrziOxm0yGjC3HghLTihcKxnbQMQ3ytBNO9hBdvtsCQFNSoj3qLgDJmtrfApspDQe6zi/IzsgViC9yPBtvQLAAT+BTWyt5XOPLOIfHf3KhXF1cyHy7e6RieKRFfBwq5STs95RgLpT6yULgo6wryBnKaJTHhDAxTvynXSA86ibhjlLoyHnG8/ElkazeIOaksoQqrDflfeH8cf0Tddr8whNk4rM+kTpBgfduIRo00C7TOeuBG8vlcmBsq4OY+A9kVLJzL43e+RDDHQIDAQABAoIBAGpgGs4O2IctIOxgd9BJgAMTOu4hng5yazV6ddKqKC3NbGL4ziNpqc88GIRCgDzFlJqHLUpQy9bbrblEHr85R58+PgpUXzvN+yNyMsCIlUGvQgu6XH+id2icEKkwq2tNR5WiXDyiCAc7QM1xDL7vLbO/4sYSx7M6feehAB9WC25yDE1OND5OdqvVqKUtdkI4Vcg4hs7XwJ5Xr71Yw+afSa0ODYPTUSQce4Z6qLsyVGLoQra5MV8Xbqd4fpZTzItGe/3BB/Nih6XSxE917SnHrzzTvnudKWoyI/OHw0LqQd1u1BGgF9akZ98ue+m3j5xs3+ExxhhNZ75QLQxJHEj5NlkCgYEAyaDYBN0WwexfvcvLXX1AuOAuQbZ+z7ldrzPBu3gY8U/l8C2tjtAAxD099M5QrFGtgsoZQDkC/OCWFLV8D0aB8Sn1+4XbTHXZHeucleMEnzKDNNQ42cSCLBRc2h6ZGftxMejjHhx31g96jC65t0iKpsXXpukU1yaGixJhQIJMYJMCgYEAoyk71ouoXIiwFlyZYQPqw7A7u0YZG2Fr1f3YDggw96nRY7TRaTl0yhfePX2BchIAz57CR4+Cc6DqaaPvT7JAk3iJgnrUtFa0fxSmKVYKVJwmhx4oPifNsGmjOynneL+hD02Sd8aPl9pjY7Szm4AQ2iZ7it/z3CD36rxJA72Ni48CgYBXSb67PEuh4IcCT7vW2Wavor3jzPHRU9pvAuUYF8IUlhZhiCTe8sWiLzEnTjo2n5WSTZPo7cWRXFkc1gTDSC7xDM1k+moaC9rWzS2Y5hMWKHQM5uNFw4DnPFmGREDbsrMqfDv2yTRIA6N2FLRp2InN8VCO/dD7473Tbz2TA9W06QKBgQCAjFIavLmO/hpN4/Lr3pwuRUEqURYi3mSJmo+Irqd12ROhzKpYju4W8ysjoyhDaS++ZESJAOY0l4lYZdJ8JeJ+za75YDEJTG602N35H1LQSp6IQhhOsCl8Xh4+1MsL9V69oc5OE+C6MVOxEIOZdhLQ7RTU25FT053AEUwtaECGvQKBgQC16u6vEGD1n1OZpbADZ7EqYE0vN0sgh+Xgx/YOJqU78ivtR6lTPMzLg8sZfYOs+mSST22nvCW2J6uIzxKcO8Ut3iU9xlMtOBRog5OhlGJ+JO9BpqQlK4L8ZQVJbA3c9FM2ADiMXmgfsCCN7ZE1Yx9OZP9ob0138lukE+YfqIhzkA=='),
('9c0f993a-3f6b-4e32-af5a-6375c36c4888', '822ed111-6e7a-47ff-a134-011d52a3451a', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('9d06d17d-07f0-4dcb-9cbf-718040e5c201', '264cd633-9bb4-4563-a4cf-6aed66da5191', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('9f82730e-60fb-4b7a-9272-5368751742c4', 'b17d8c1c-74a5-40b5-b525-053db3b8e348', 'max-clients', '200'),
('a1e39228-1b99-4e8e-828f-ec5036161968', '613a4a6b-6181-4a58-82ac-7fee3c067229', 'allow-default-scopes', 'true'),
('ac47f4ea-e759-4159-8b3b-d9667790cb68', 'f9bca48b-29d0-477b-b8ed-43871397b2a5', 'secret', 'khoNxfoW5idlftCG6FBNuFV7aX1yEFQXqjwsywCohv5ZwxJu3GUa_5lo0qtHlvgaaFx7IYaMJ9rSaC6Zi3uIvA'),
('b67769b1-a16b-4ae7-9813-b905725a7876', '840b3ad2-609b-4521-bf93-f3daa2acb91d', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('b7a29000-4e2b-4b13-ac5e-998ff839d432', 'd1d1a92b-9b6c-4a35-839d-59b6628067e0', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('b9515ad1-afe8-404b-9ce3-a1c58e546d3e', 'ac1cab2b-78d7-4dce-b203-f3e9705ce0e2', 'algorithm', 'RS256'),
('bb92ec33-b0ce-4856-a5f1-b47b01b46d07', '165c48a1-69f5-4acf-8c87-d686e16cbb8e', 'max-clients', '200'),
('bc130e11-7f4f-4964-9489-78cc1d5df791', 'ab15c7ed-df30-4d4c-8efe-ca565d61aae8', 'host-sending-registration-request-must-match', 'true'),
('bd252d6b-9b5d-482a-a145-4ba125c82a45', 'd1d1a92b-9b6c-4a35-839d-59b6628067e0', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('bd3c13e7-16cd-4e16-ad4b-a017a0b8506e', '822ed111-6e7a-47ff-a134-011d52a3451a', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('c2364607-a1d6-4a51-9e83-d25f6be7db27', 'c4b7b008-f96b-4030-81c4-97615d92973d', 'priority', '100'),
('ca8bb327-4064-476a-b788-6ebd7a716e0f', 'd1d1a92b-9b6c-4a35-839d-59b6628067e0', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('cadc8ea5-bc24-4503-88a0-50ffbe8cf42b', '822ed111-6e7a-47ff-a134-011d52a3451a', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('cd77099e-6fe1-4ba8-91f0-07c61307d530', '70dea281-d223-4dda-bf77-733df657d511', 'kid', 'db86e8f9-8fd2-4f23-a826-32e0225a6510'),
('d27b5ba6-7247-47c1-a231-2345bb7255f8', '5f63813f-11b8-4a23-945b-4ed4f3467528', 'kid', 'e523845d-1a9b-418f-987f-fc699e4e89b7'),
('d58a0d6e-e786-4040-bc6a-f00d26c94d28', '840b3ad2-609b-4521-bf93-f3daa2acb91d', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('d7316021-dbc9-4a9d-92dd-062f48a872b8', '840b3ad2-609b-4521-bf93-f3daa2acb91d', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('d758d9f6-bad1-4885-8ba4-8b4f463366a9', '822ed111-6e7a-47ff-a134-011d52a3451a', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('de3a2a36-4c69-42b1-ba89-d6ec7197cf3a', 'f9bca48b-29d0-477b-b8ed-43871397b2a5', 'kid', 'd23e99a7-2505-4910-8878-31e51308a76c'),
('de7a290d-8096-411f-9b1f-b877d7b4335a', 'd1d1a92b-9b6c-4a35-839d-59b6628067e0', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('e3528a77-3032-4c58-b1ae-9ca5be87b86f', 'ac1cab2b-78d7-4dce-b203-f3e9705ce0e2', 'priority', '-100'),
('e377ae52-1007-41d8-ab1d-6b046c22f698', '264cd633-9bb4-4563-a4cf-6aed66da5191', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('e3f66c58-7f48-42f0-8654-34caee74a091', 'd1d1a92b-9b6c-4a35-839d-59b6628067e0', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('eb765960-cb05-4c3b-a865-c9fc6c23452d', '0c198751-63a8-4964-b170-9b39c4b7e48c', 'client-uris-must-match', 'true'),
('fceed9cd-2d30-490f-a79c-610fa2971664', '264cd633-9bb4-4563-a4cf-6aed66da5191', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');

-- --------------------------------------------------------

--
-- Table structure for table `COMPOSITE_ROLE`
--

CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

INSERT INTO `COMPOSITE_ROLE` (`COMPOSITE`, `CHILD_ROLE`) VALUES
('00f71082-05db-485f-a531-5db40ffd40ba', '23f9acba-19bb-40c0-a4e3-eab0e4fd5c0d'),
('3b695abe-dedb-4741-bba7-00728e4a8195', '6bf6c57e-0c10-49ac-961c-2a5d76aeca50'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '1552c4d8-e60d-44ab-b7e1-2ecb22ea00c6'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '1fdd06ff-e8ce-4540-8f6b-b9167c57642a'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '26e7e20b-4b88-41c6-b7e9-9d6cdaafa0a9'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '3a840cc7-a104-4f54-aa3b-22ce7bcf2e7d'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '59ad302e-3aaf-4e12-b19e-a1dec0ac459d'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '5e32d15e-c206-48ff-a96c-c5c90af0cb85'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '5ebb798a-fef4-410d-90c3-175f720aeaf7'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '62bf4016-e219-4c18-a317-3fdcb609a60a'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '66974806-b332-40d1-9af3-031b704e2e3b'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '6b29bfb6-33f6-4a42-b3d6-c41ed60ca679'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '730bc986-5436-4937-bab6-b5c3472a99b1'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '8aadeee0-834a-4af1-9986-fa1dbf2210eb'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', '8e80d1f7-f680-4f8c-87fa-8d9553bda855'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', 'a83df72f-fd0f-4e96-9e68-72a432e94ef6'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', 'adaf3a44-cd9c-47f9-b694-3c1c987b8936'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', 'b997c69b-d392-4338-a01c-d412b6632593'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', 'd1cd7d7f-9fca-4b33-98dc-5b6c22a3ab7b'),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', 'd6afc930-2df3-4f15-840a-800e2c37a082'),
('4446f6d1-86ca-4392-8749-6c2bf6941daa', 'b1cb1bff-903e-4c88-bacd-43dc81589c6f'),
('5c65f06b-26d0-47af-b93e-f729ba123eb1', '0c6e2eaa-1e5a-497f-89d0-db58909b4863'),
('5c65f06b-26d0-47af-b93e-f729ba123eb1', '97f436ce-5a34-416f-b303-735d9a64f301'),
('5ebb798a-fef4-410d-90c3-175f720aeaf7', 'a83df72f-fd0f-4e96-9e68-72a432e94ef6'),
('730bc986-5436-4937-bab6-b5c3472a99b1', '66974806-b332-40d1-9af3-031b704e2e3b'),
('730bc986-5436-4937-bab6-b5c3472a99b1', 'b997c69b-d392-4338-a01c-d412b6632593'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '00f71082-05db-485f-a531-5db40ffd40ba'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '05886f60-742e-4466-bd37-88e58406a9c7'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '08ba35b1-434b-4d52-adc1-2cfff3e4c6f5'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '0c6e2eaa-1e5a-497f-89d0-db58909b4863'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '0fc8f43c-a989-4f44-84cc-dbba9fcd568f'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '118322ac-6f7e-49e3-91c4-ddd39f8dcc83'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '173cf79f-fe77-405f-859d-0461d9fe2d33'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '198627b7-f529-43e4-8f65-a46a67ca9598'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '20d18d57-0d78-48b9-bcbb-c12252ae6ddb'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '23f9acba-19bb-40c0-a4e3-eab0e4fd5c0d'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '26c763b2-a46e-4611-ae5d-d22094fb330e'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '2b84706c-2d44-4439-9705-414c5fc24d4e'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '30572c74-f825-4589-85bf-5da10b8df466'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '3194f21c-f9af-4eca-84b2-c3106ad40c97'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '336b5755-3bb3-420f-93ed-7a1710f1fe0b'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '3b695abe-dedb-4741-bba7-00728e4a8195'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '412ad85c-3d16-410a-bd20-478ef8616ca8'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '59206c26-90a4-4f03-a031-781d139799cb'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '5c65f06b-26d0-47af-b93e-f729ba123eb1'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '6a770b91-e342-44e5-9bf1-a0f1d8ee8885'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '6bf6c57e-0c10-49ac-961c-2a5d76aeca50'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '6d31913f-a754-4327-8440-dad2c921e581'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '72548882-dfb2-4e61-954a-ef0ab89cfbb9'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '739c1866-d305-4c91-8281-1deec35de3a1'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', '97f436ce-5a34-416f-b303-735d9a64f301'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'a5e5c7f7-f40a-4d5a-9471-e60264d3b23c'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'ade943b7-c491-4fd8-9253-f9fc7cd5387f'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'afb97f55-eda2-4752-ad1c-b8703d306f92'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'b5d971e4-7825-4a67-8fe2-6297eef983b4'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'c8f0e312-d89d-4342-98a8-1c2f35a63b03'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'd5e31d9b-7045-4e29-a54e-876ea8da7a45'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'd91b5001-237c-4287-bb43-14c87d1f8a39'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'da102684-99bb-457e-a569-b2a14fea2e15'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'e1d0dd79-0150-45ad-8285-98f80db80888'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'e72343a0-bfac-4488-8bc9-60d3581a3310'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'e9c0ae89-903f-40a5-9e9a-2c797ae24022'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'fb747126-e1be-4bf4-9f78-f0a6e4caf30f'),
('97d6871f-dee1-4ad2-b08f-f7c7b8b62f15', '6b44ac8d-13e9-43fd-be4a-b6f9784ae1bb'),
('a5e5c7f7-f40a-4d5a-9471-e60264d3b23c', '173cf79f-fe77-405f-859d-0461d9fe2d33'),
('a5e5c7f7-f40a-4d5a-9471-e60264d3b23c', 'ade943b7-c491-4fd8-9253-f9fc7cd5387f'),
('cab086d7-91b8-4670-affd-30816cc565f7', 'b5900284-d36d-42e2-adb6-92f4d37c145f'),
('f7cde267-aed9-46b3-aa11-6a01c3ef9ce7', 'd80b2ce4-ff28-4dc8-8fd1-6ccea6126118');

-- --------------------------------------------------------

--
-- Table structure for table `CREDENTIAL`
--

CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CREDENTIAL`
--

INSERT INTO `CREDENTIAL` (`ID`, `SALT`, `TYPE`, `USER_ID`, `CREATED_DATE`, `USER_LABEL`, `SECRET_DATA`, `CREDENTIAL_DATA`, `PRIORITY`) VALUES
('05b06ac0-8ae7-4996-86ea-7bba47cd9ff3', NULL, 'password', 'a8a84f5d-bf2f-4d79-9169-64d3720e9b07', 1610400319412, NULL, '{\"value\":\"xe0lVrAb4GsweB4yn1JHpIBIIvuyLY0Sn0TMNKcvB3UQ/JOpdSozgVengKMNIBpovrPn1T/vSakM3vLzbgleaQ==\",\"salt\":\"1gxCsvg6ciiN3jRdjpShPA==\",\"additionalParameters\":{}}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}', 10),
('f45d1d1e-1243-4b6f-9a23-220a7bfe7cb0', NULL, 'password', 'a515ae23-5e28-408b-ab95-72494a490afc', 1610400404843, NULL, '{\"value\":\"GUKngMCwqqBN/vmZn8st6b10BtZZzGJewUV1QBe2X5/l/ClSlx661+gA4sHyU6bxNtNo4BoTmJTh0w2x1Rusrg==\",\"salt\":\"tYMhdnn0iVugEVFKuOy6Kg==\",\"additionalParameters\":{}}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}', 10);

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOG`
--

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DATABASECHANGELOG`
--

INSERT INTO `DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2021-01-11 21:25:06', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2021-01-11 21:25:06', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2021-01-11 21:25:06', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2021-01-11 21:25:06', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2021-01-11 21:25:07', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2021-01-11 21:25:07', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2021-01-11 21:25:07', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2021-01-11 21:25:07', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2021-01-11 21:25:07', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2021-01-11 21:25:07', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2021-01-11 21:25:08', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2021-01-11 21:25:08', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2021-01-11 21:25:08', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-01-11 21:25:08', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-01-11 21:25:08', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-01-11 21:25:08', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-01-11 21:25:08', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2021-01-11 21:25:08', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2021-01-11 21:25:08', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2021-01-11 21:25:08', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-01-11 21:25:08', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-01-11 21:25:08', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2021-01-11 21:25:08', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2021-01-11 21:25:08', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2021-01-11 21:25:08', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2021-01-11 21:25:08', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2021-01-11 21:25:09', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2021-01-11 21:25:09', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2021-01-11 21:25:09', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2021-01-11 21:25:09', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2021-01-11 21:25:09', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2021-01-11 21:25:09', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-01-11 21:25:09', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-01-11 21:25:09', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-01-11 21:25:09', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2021-01-11 21:25:09', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-01-11 21:25:09', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2021-01-11 21:25:09', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2021-01-11 21:25:09', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-01-11 21:25:09', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-01-11 21:25:09', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2021-01-11 21:25:09', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-01-11 21:25:10', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2021-01-11 21:25:10', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-01-11 21:25:10', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-01-11 21:25:10', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-01-11 21:25:10', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-01-11 21:25:10', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-01-11 21:25:10', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2021-01-11 21:25:10', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2021-01-11 21:25:10', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2021-01-11 21:25:10', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2021-01-11 21:25:10', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2021-01-11 21:25:10', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-01-11 21:25:10', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-01-11 21:25:10', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-01-11 21:25:11', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-01-11 21:25:11', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2021-01-11 21:25:11', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2021-01-11 21:25:11', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-01-11 21:25:11', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-01-11 21:25:11', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2021-01-11 21:25:11', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2021-01-11 21:25:11', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-01-11 21:25:11', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2021-01-11 21:25:11', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-01-11 21:25:11', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2021-01-11 21:25:11', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2021-01-11 21:25:11', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2021-01-11 21:25:12', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2021-01-11 21:25:12', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-01-11 21:25:12', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-01-11 21:25:12', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-01-11 21:25:12', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-01-11 21:25:12', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-01-11 21:25:12', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-01-11 21:25:12', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-01-11 21:25:12', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-01-11 21:25:12', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-01-11 21:25:12', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-01-11 21:25:12', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-01-11 21:25:12', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-01-11 21:25:12', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-01-11 21:25:12', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-01-11 21:25:12', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2021-01-11 21:25:12', 86, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-01-11 21:25:12', 87, 'EXECUTED', '7:578d0b92077eaf2ab95ad0ec087aa903', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '0400305532'),
('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-01-11 21:25:12', 88, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '0400305532');

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
(1, b'0', NULL, NULL),
(1000, b'0', NULL, NULL),
(1001, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

INSERT INTO `DEFAULT_CLIENT_SCOPE` (`REALM_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`) VALUES
('master', '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e', b'1'),
('master', '0c4051b3-5e22-47c6-878f-34c9dd8d6294', b'1'),
('master', '135c27f2-629b-4542-8b29-4c2b896eabe3', b'0'),
('master', '6543c8d5-09c4-4a49-bb69-474bb79e712b', b'1'),
('master', '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf', b'0'),
('master', '83b587df-db27-499f-8bd6-2666abd8148e', b'0'),
('master', 'b01caa13-d061-4501-af1a-d61290f7c2fb', b'1'),
('master', 'ba260e12-abf6-4b57-ab38-a3b0e83ee109', b'0'),
('master', 'd7dde753-b227-400d-af3e-993ebaedae54', b'1'),
('myrealm', '06a10ec3-0003-4796-ab20-effabe78b1fc', b'0'),
('myrealm', '0ffff138-7bd7-4872-813f-96e3d060e024', b'1'),
('myrealm', '23e7aeec-d9c8-4034-9562-976d789a4fcc', b'0'),
('myrealm', '2b5ee063-bcbb-4132-b43c-9291d7022a95', b'1'),
('myrealm', '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57', b'1'),
('myrealm', '87413bf1-a276-471f-9130-13ae27eb3f76', b'0'),
('myrealm', 'a2280cb2-b9de-4c81-88f7-28b7903cbafc', b'1'),
('myrealm', 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf', b'0'),
('myrealm', 'e3206894-28bb-4261-9a13-f1656e96dc56', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `EVENT_ENTITY`
--

CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FEDERATED_IDENTITY`
--

CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FEDERATED_USER`
--

CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_CONSENT`
--

CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IDENTITY_PROVIDER`
--

CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `KEYCLOAK_GROUP`
--

CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `KEYCLOAK_ROLE`
--

CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

INSERT INTO `KEYCLOAK_ROLE` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('00f71082-05db-485f-a531-5db40ffd40ba', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_view-clients}', 'view-clients', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('05886f60-742e-4466-bd37-88e58406a9c7', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_manage-authorization}', 'manage-authorization', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('08ba35b1-434b-4d52-adc1-2cfff3e4c6f5', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('0c6e2eaa-1e5a-497f-89d0-db58909b4863', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_query-groups}', 'query-groups', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('0fc8f43c-a989-4f44-84cc-dbba9fcd568f', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_manage-realm}', 'manage-realm', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('118322ac-6f7e-49e3-91c4-ddd39f8dcc83', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_create-client}', 'create-client', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('1552c4d8-e60d-44ab-b7e1-2ecb22ea00c6', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_view-events}', 'view-events', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('173cf79f-fe77-405f-859d-0461d9fe2d33', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_query-users}', 'query-users', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('195d9b4a-8781-484b-860b-e1371a25c2c4', 'master', b'0', '${role_offline-access}', 'offline_access', 'master', NULL, 'master'),
('198627b7-f529-43e4-8f65-a46a67ca9598', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_manage-users}', 'manage-users', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('1b2efd69-905e-41d2-8130-294468cfa6ae', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', b'1', '${role_view-applications}', 'view-applications', 'master', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', NULL),
('1b7483bd-5613-4d5b-95ad-5b6e72c4050b', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', b'1', '${role_view-profile}', 'view-profile', 'master', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', NULL),
('1fdd06ff-e8ce-4540-8f6b-b9167c57642a', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_view-realm}', 'view-realm', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('20d18d57-0d78-48b9-bcbb-c12252ae6ddb', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_create-client}', 'create-client', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('23f9acba-19bb-40c0-a4e3-eab0e4fd5c0d', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_query-clients}', 'query-clients', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('26c763b2-a46e-4611-ae5d-d22094fb330e', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_view-realm}', 'view-realm', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('26e7e20b-4b88-41c6-b7e9-9d6cdaafa0a9', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_manage-users}', 'manage-users', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('2b84706c-2d44-4439-9705-414c5fc24d4e', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_manage-events}', 'manage-events', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('30572c74-f825-4589-85bf-5da10b8df466', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('3194f21c-f9af-4eca-84b2-c3106ad40c97', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_view-events}', 'view-events', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('32511aeb-6816-4d95-9440-0c9ecf258194', 'myrealm', b'0', NULL, 'user', 'myrealm', NULL, 'myrealm'),
('336b5755-3bb3-420f-93ed-7a1710f1fe0b', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_view-authorization}', 'view-authorization', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('38435b98-6755-4f9b-878c-502c455adcb2', '3a58ead6-8521-4849-aae4-8fa354f3bfaa', b'1', '${role_read-token}', 'read-token', 'master', '3a58ead6-8521-4849-aae4-8fa354f3bfaa', NULL),
('3a840cc7-a104-4f54-aa3b-22ce7bcf2e7d', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_view-authorization}', 'view-authorization', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('3b695abe-dedb-4741-bba7-00728e4a8195', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_view-clients}', 'view-clients', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('412ad85c-3d16-410a-bd20-478ef8616ca8', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_view-events}', 'view-events', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('4140f533-3552-45d9-ae42-b64d88e6d6ad', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_realm-admin}', 'realm-admin', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('4446f6d1-86ca-4392-8749-6c2bf6941daa', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', b'1', '${role_manage-consent}', 'manage-consent', 'master', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', NULL),
('59206c26-90a4-4f03-a031-781d139799cb', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_manage-clients}', 'manage-clients', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('59ad302e-3aaf-4e12-b19e-a1dec0ac459d', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_create-client}', 'create-client', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('5c65f06b-26d0-47af-b93e-f729ba123eb1', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_view-users}', 'view-users', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('5e32d15e-c206-48ff-a96c-c5c90af0cb85', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_manage-clients}', 'manage-clients', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('5ebb798a-fef4-410d-90c3-175f720aeaf7', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_view-clients}', 'view-clients', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('62bf4016-e219-4c18-a317-3fdcb609a60a', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('66974806-b332-40d1-9af3-031b704e2e3b', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_query-users}', 'query-users', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('684c28bb-90e1-4f35-b390-e0c4a8e563df', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', b'1', '${role_delete-account}', 'delete-account', 'master', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', NULL),
('6a770b91-e342-44e5-9bf1-a0f1d8ee8885', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_view-realm}', 'view-realm', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('6b29bfb6-33f6-4a42-b3d6-c41ed60ca679', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_manage-events}', 'manage-events', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('6b44ac8d-13e9-43fd-be4a-b6f9784ae1bb', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', b'1', '${role_manage-account-links}', 'manage-account-links', 'master', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', NULL),
('6bf6c57e-0c10-49ac-961c-2a5d76aeca50', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_query-clients}', 'query-clients', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('6d31913f-a754-4327-8440-dad2c921e581', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_manage-clients}', 'manage-clients', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('72548882-dfb2-4e61-954a-ef0ab89cfbb9', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_manage-realm}', 'manage-realm', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('72f0e236-6673-4c22-8d91-3a903ad26967', '6469b17a-412a-4b1f-ab11-80cc86ee8b2e', b'1', '${role_read-token}', 'read-token', 'myrealm', '6469b17a-412a-4b1f-ab11-80cc86ee8b2e', NULL),
('730bc986-5436-4937-bab6-b5c3472a99b1', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_view-users}', 'view-users', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('739c1866-d305-4c91-8281-1deec35de3a1', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('87aeed31-fbd4-4d35-a162-8e77618c11d1', '37b72042-6743-430a-969e-93b37410e404', b'1', '${role_view-applications}', 'view-applications', 'myrealm', '37b72042-6743-430a-969e-93b37410e404', NULL),
('8aadeee0-834a-4af1-9986-fa1dbf2210eb', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('8e80d1f7-f680-4f8c-87fa-8d9553bda855', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_impersonation}', 'impersonation', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('931003d6-4178-49ce-8dbd-a4414a82983d', '37b72042-6743-430a-969e-93b37410e404', b'1', '${role_view-profile}', 'view-profile', 'myrealm', '37b72042-6743-430a-969e-93b37410e404', NULL),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'master', b'0', '${role_admin}', 'admin', 'master', NULL, 'master'),
('97d6871f-dee1-4ad2-b08f-f7c7b8b62f15', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', b'1', '${role_manage-account}', 'manage-account', 'master', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', NULL),
('97f436ce-5a34-416f-b303-735d9a64f301', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_query-users}', 'query-users', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('a218f51c-cb1a-43e7-b30f-530351bd0820', 'myrealm', b'0', '${role_offline-access}', 'offline_access', 'myrealm', NULL, 'myrealm'),
('a5e5c7f7-f40a-4d5a-9471-e60264d3b23c', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_view-users}', 'view-users', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('a83df72f-fd0f-4e96-9e68-72a432e94ef6', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_query-clients}', 'query-clients', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('adaf3a44-cd9c-47f9-b694-3c1c987b8936', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_query-realms}', 'query-realms', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('ade943b7-c491-4fd8-9253-f9fc7cd5387f', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_query-groups}', 'query-groups', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('afb97f55-eda2-4752-ad1c-b8703d306f92', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_query-realms}', 'query-realms', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('b1cb1bff-903e-4c88-bacd-43dc81589c6f', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', b'1', '${role_view-consent}', 'view-consent', 'master', '13ddf38d-ef75-4de7-a4e7-5f81b5649b43', NULL),
('b3ed89e4-ae5c-4d40-bb8d-358de97414c9', '37b72042-6743-430a-969e-93b37410e404', b'1', '${role_delete-account}', 'delete-account', 'myrealm', '37b72042-6743-430a-969e-93b37410e404', NULL),
('b5900284-d36d-42e2-adb6-92f4d37c145f', '37b72042-6743-430a-969e-93b37410e404', b'1', '${role_view-consent}', 'view-consent', 'myrealm', '37b72042-6743-430a-969e-93b37410e404', NULL),
('b5d971e4-7825-4a67-8fe2-6297eef983b4', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_impersonation}', 'impersonation', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('b997c69b-d392-4338-a01c-d412b6632593', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_query-groups}', 'query-groups', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('c8f0e312-d89d-4342-98a8-1c2f35a63b03', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_manage-events}', 'manage-events', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('cab086d7-91b8-4670-affd-30816cc565f7', '37b72042-6743-430a-969e-93b37410e404', b'1', '${role_manage-consent}', 'manage-consent', 'myrealm', '37b72042-6743-430a-969e-93b37410e404', NULL),
('cbf8c119-31b3-4bae-92c0-ce94de3415f2', '3e90ef2d-fb8a-4544-8f75-390af599c0ac', b'1', NULL, 'user', 'myrealm', '3e90ef2d-fb8a-4544-8f75-390af599c0ac', NULL),
('d1cd7d7f-9fca-4b33-98dc-5b6c22a3ab7b', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_manage-realm}', 'manage-realm', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('d4f6f28f-e200-4ca1-862d-c13b51347f90', 'myrealm', b'0', '${role_uma_authorization}', 'uma_authorization', 'myrealm', NULL, 'myrealm'),
('d5e31d9b-7045-4e29-a54e-876ea8da7a45', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_manage-users}', 'manage-users', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('d6afc930-2df3-4f15-840a-800e2c37a082', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', b'1', '${role_manage-authorization}', 'manage-authorization', 'myrealm', 'a90340bf-3b3b-4e7f-bae0-7efdf1c9b786', NULL),
('d80b2ce4-ff28-4dc8-8fd1-6ccea6126118', '37b72042-6743-430a-969e-93b37410e404', b'1', '${role_manage-account-links}', 'manage-account-links', 'myrealm', '37b72042-6743-430a-969e-93b37410e404', NULL),
('d91b5001-237c-4287-bb43-14c87d1f8a39', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('da102684-99bb-457e-a569-b2a14fea2e15', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_view-authorization}', 'view-authorization', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('e1d0dd79-0150-45ad-8285-98f80db80888', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_query-realms}', 'query-realms', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL),
('e72343a0-bfac-4488-8bc9-60d3581a3310', 'master', b'0', '${role_create-realm}', 'create-realm', 'master', NULL, 'master'),
('e9c0ae89-903f-40a5-9e9a-2c797ae24022', 'bc72954a-b973-4654-9a9d-f7e8db39498c', b'1', '${role_manage-authorization}', 'manage-authorization', 'master', 'bc72954a-b973-4654-9a9d-f7e8db39498c', NULL),
('f173aec1-599d-40c2-a5a3-36d6e76be492', 'master', b'0', '${role_uma_authorization}', 'uma_authorization', 'master', NULL, 'master'),
('f7cde267-aed9-46b3-aa11-6a01c3ef9ce7', '37b72042-6743-430a-969e-93b37410e404', b'1', '${role_manage-account}', 'manage-account', 'myrealm', '37b72042-6743-430a-969e-93b37410e404', NULL),
('fb747126-e1be-4bf4-9f78-f0a6e4caf30f', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', b'1', '${role_impersonation}', 'impersonation', 'master', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MIGRATION_MODEL`
--

CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MIGRATION_MODEL`
--

INSERT INTO `MIGRATION_MODEL` (`ID`, `VERSION`, `UPDATE_TIME`) VALUES
('qsckj', '12.0.1', 1610400315);

-- --------------------------------------------------------

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `POLICY_CONFIG`
--

CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `fieldType` varchar(25) NOT NULL,
  `user_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `label`, `value`, `fieldType`, `user_id`) VALUES
(1, 'Bio', 'Joel Lord is passionate about the web and technology in general.  He likes to learn new things, but most of all, he wants to share his discoveries.  He does so by travelling at various conferences all across the globe.\nHe graduated from college in computer programming in the last millennium.  Apart from a little break to get his BSc in computational astrophysics, he was always in the industry.\nAs a developer advocate with Red Hat OpenShift, he meets with developers to help them make the web better by using best practices around Kubernetes.\nDuring his free time, he is usually found stargazing in a camping site somewhere or brewing a fresh batch of beer in his garage.\n', 'long', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(2, 'Twitter', 'https://twitter.com/joel__lord', 'link', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(3, 'LinkedIn', 'https://www.linkedin.com/in/joel-lord/', 'link', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(4, 'Video of good talk', 'https://www.youtube.com/watch?v=qdrsOgJRofs', 'link', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(5, 'List of events', 'I speak at a lot of events. I love sharing when I can. An (almost) complete list of past speaking engagements is available here: https://javascripteverything.com/speaking.', 'long', 'a515ae23-5e28-408b-ab95-72494a490afc');

-- --------------------------------------------------------

--
-- Table structure for table `PROTOCOL_MAPPER`
--

CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

INSERT INTO `PROTOCOL_MAPPER` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CLIENT_ID`, `CLIENT_SCOPE_ID`) VALUES
('03987124-f9c2-4702-b07d-afd898b46ccc', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'e3206894-28bb-4261-9a13-f1656e96dc56'),
('07532d7e-31ba-4a6c-85e6-07382b2c26c4', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('07e2e53f-66db-472a-96b9-e844350057d7', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('0c7ae916-5c7d-403c-8142-6051f671ab0e', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('0c7da9a5-cd39-4885-add9-0259cc8571ce', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('161b82d7-9b1a-44c8-a2e6-6a41577141ae', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '0c4051b3-5e22-47c6-878f-34c9dd8d6294'),
('19f2e287-75a1-4da8-9439-17bc8094abd6', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('1b78e77d-0e46-4d01-ba2f-66d70d90a600', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '0c4051b3-5e22-47c6-878f-34c9dd8d6294'),
('1bab73da-6254-453c-95cf-b77848ea3d11', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e'),
('27b5ca7c-7400-46a3-b687-b34c4e42818e', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '135c27f2-629b-4542-8b29-4c2b896eabe3'),
('292788b8-0c6f-4a4e-91b4-86fe034b0a68', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('32fa0d3a-1e1e-4f71-82cc-8ed53c499725', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('374544f8-117a-49cc-9677-eba55c9d3b52', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('3d836b85-79a5-4b8c-b6a8-e24fd2b5550d', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf'),
('4330cc23-942f-4e84-8db2-23ccb0b833bb', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('4e8086e5-4afb-4295-b2b1-495a26084fa4', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('60b82f12-4121-47f1-b4ec-386371245646', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf'),
('621688a7-85cb-4e3b-a859-9e581ff04fff', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', NULL),
('6276b71f-2058-45aa-9073-16a9a715866b', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'd7dde753-b227-400d-af3e-993ebaedae54'),
('764e17a8-57c0-4a20-afe8-f7107a978209', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '090fff5b-4ef6-4d10-8e2d-91b6417f2d4e'),
('7720ec4c-c548-43d2-b2a1-01980ce08741', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'a2280cb2-b9de-4c81-88f7-28b7903cbafc'),
('79c0df13-c66e-4783-861c-b5c5819675de', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('7e050725-6bf3-4221-a988-2d24cbb98dff', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'e05b255a-e287-427b-8837-13b3380af674', NULL),
('83e2bb47-86f4-4e2f-b7c2-f65d6840f422', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('84b0fee5-2034-44af-a452-7c765a4f8ea0', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('84f389cb-b192-4504-8b45-5b1e229daa75', 'role list', 'saml', 'saml-role-list-mapper', NULL, '0ffff138-7bd7-4872-813f-96e3d060e024'),
('9046ad67-c304-4de0-97a1-04bb2d26ca5a', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('9434e490-eede-4087-a238-c129999120ac', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '59eb45a6-1f7c-4c9f-9aae-ae01e2efee57'),
('95fa537b-371c-47c5-b576-85cf0f781bef', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'e02d090f-d51d-4c07-9874-6fb8e19b7f6a', NULL),
('9626c352-af07-4c7d-a0f9-b38ecf035757', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('99265266-2e88-4738-9d40-d5d18c744710', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '83b587df-db27-499f-8bd6-2666abd8148e'),
('9b12e38d-9e12-4592-8322-03c5844d64c1', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '87413bf1-a276-471f-9130-13ae27eb3f76'),
('a1a53418-45da-4488-b684-f55a2e2ff17b', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'e3206894-28bb-4261-9a13-f1656e96dc56'),
('a50606c6-e5a2-42d7-8df8-68e0db091905', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '0c4051b3-5e22-47c6-878f-34c9dd8d6294'),
('a68c83c9-b4a1-4f20-927b-9726a2ceaa39', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('abee168e-25ff-4eba-8731-2273f1389109', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('ac2cade0-4786-4e34-81b6-6d2940487c4e', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '0fc8ce1e-76de-4ae2-8f73-cd38c669863f', NULL),
('acb6e0bc-b39d-4a9c-9176-60be4c03d0e5', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('af8aeecc-44f2-4638-b5e8-4d32b2068c70', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('b52bef34-1216-4ed9-95fc-fa9c62bc3173', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('c2e5d260-8711-4cd3-89a0-5525cd21cb26', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('c6c7d390-fa22-4203-9906-34def1f6f846', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('c91a10a0-a381-4be2-aeb8-a25f89ebcf48', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'b01caa13-d061-4501-af1a-d61290f7c2fb'),
('d242eb86-9a72-4004-b347-9c2d75c089b1', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('de0c74d1-1703-442e-b7f9-ba7a705a7c69', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('df93d932-1645-4a48-a964-c132903c2dcf', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('e1ebf0e2-e5e6-404e-94c7-a450ba9252d9', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '6a536bed-7fb4-4b1f-a1af-71407fd3cfdf'),
('e49ceac0-6bb7-43e9-99a3-9439b5417ef0', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('e7da8893-f0ac-4d48-b995-f95857358e4c', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '87413bf1-a276-471f-9130-13ae27eb3f76'),
('e80b6ff2-25c1-4f47-b455-7cbce8c337b8', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'a2280cb2-b9de-4c81-88f7-28b7903cbafc'),
('ec261033-2e41-4422-bad4-928fed04059a', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '23e7aeec-d9c8-4034-9562-976d789a4fcc'),
('ec38aecf-5fe3-4d2b-9f3c-78a71276e0da', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2b5ee063-bcbb-4132-b43c-9291d7022a95'),
('f5ae6cd1-ebe8-4e51-ad7f-d01a071a6937', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6543c8d5-09c4-4a49-bb69-474bb79e712b'),
('f88ff5d2-c01c-4810-9022-ff7a2665f05a', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'b5fc920e-5b79-4e49-b8b7-5b626ced5dcf'),
('fbc6ae18-6a7c-46b5-a386-d74fbf6d6fc0', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'e3206894-28bb-4261-9a13-f1656e96dc56'),
('feacd273-1971-47dd-9dec-d3e2239b3a3d', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '135c27f2-629b-4542-8b29-4c2b896eabe3');

-- --------------------------------------------------------

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

INSERT INTO `PROTOCOL_MAPPER_CONFIG` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES
('03987124-f9c2-4702-b07d-afd898b46ccc', 'true', 'access.token.claim'),
('03987124-f9c2-4702-b07d-afd898b46ccc', 'realm_access.roles', 'claim.name'),
('03987124-f9c2-4702-b07d-afd898b46ccc', 'String', 'jsonType.label'),
('03987124-f9c2-4702-b07d-afd898b46ccc', 'true', 'multivalued'),
('03987124-f9c2-4702-b07d-afd898b46ccc', 'foo', 'user.attribute'),
('07532d7e-31ba-4a6c-85e6-07382b2c26c4', 'true', 'access.token.claim'),
('07532d7e-31ba-4a6c-85e6-07382b2c26c4', 'zoneinfo', 'claim.name'),
('07532d7e-31ba-4a6c-85e6-07382b2c26c4', 'true', 'id.token.claim'),
('07532d7e-31ba-4a6c-85e6-07382b2c26c4', 'String', 'jsonType.label'),
('07532d7e-31ba-4a6c-85e6-07382b2c26c4', 'zoneinfo', 'user.attribute'),
('07532d7e-31ba-4a6c-85e6-07382b2c26c4', 'true', 'userinfo.token.claim'),
('07e2e53f-66db-472a-96b9-e844350057d7', 'true', 'access.token.claim'),
('07e2e53f-66db-472a-96b9-e844350057d7', 'birthdate', 'claim.name'),
('07e2e53f-66db-472a-96b9-e844350057d7', 'true', 'id.token.claim'),
('07e2e53f-66db-472a-96b9-e844350057d7', 'String', 'jsonType.label'),
('07e2e53f-66db-472a-96b9-e844350057d7', 'birthdate', 'user.attribute'),
('07e2e53f-66db-472a-96b9-e844350057d7', 'true', 'userinfo.token.claim'),
('0c7ae916-5c7d-403c-8142-6051f671ab0e', 'true', 'access.token.claim'),
('0c7ae916-5c7d-403c-8142-6051f671ab0e', 'gender', 'claim.name'),
('0c7ae916-5c7d-403c-8142-6051f671ab0e', 'true', 'id.token.claim'),
('0c7ae916-5c7d-403c-8142-6051f671ab0e', 'String', 'jsonType.label'),
('0c7ae916-5c7d-403c-8142-6051f671ab0e', 'gender', 'user.attribute'),
('0c7ae916-5c7d-403c-8142-6051f671ab0e', 'true', 'userinfo.token.claim'),
('0c7da9a5-cd39-4885-add9-0259cc8571ce', 'true', 'access.token.claim'),
('0c7da9a5-cd39-4885-add9-0259cc8571ce', 'zoneinfo', 'claim.name'),
('0c7da9a5-cd39-4885-add9-0259cc8571ce', 'true', 'id.token.claim'),
('0c7da9a5-cd39-4885-add9-0259cc8571ce', 'String', 'jsonType.label'),
('0c7da9a5-cd39-4885-add9-0259cc8571ce', 'zoneinfo', 'user.attribute'),
('0c7da9a5-cd39-4885-add9-0259cc8571ce', 'true', 'userinfo.token.claim'),
('161b82d7-9b1a-44c8-a2e6-6a41577141ae', 'true', 'access.token.claim'),
('161b82d7-9b1a-44c8-a2e6-6a41577141ae', 'realm_access.roles', 'claim.name'),
('161b82d7-9b1a-44c8-a2e6-6a41577141ae', 'String', 'jsonType.label'),
('161b82d7-9b1a-44c8-a2e6-6a41577141ae', 'true', 'multivalued'),
('161b82d7-9b1a-44c8-a2e6-6a41577141ae', 'foo', 'user.attribute'),
('19f2e287-75a1-4da8-9439-17bc8094abd6', 'true', 'access.token.claim'),
('19f2e287-75a1-4da8-9439-17bc8094abd6', 'given_name', 'claim.name'),
('19f2e287-75a1-4da8-9439-17bc8094abd6', 'true', 'id.token.claim'),
('19f2e287-75a1-4da8-9439-17bc8094abd6', 'String', 'jsonType.label'),
('19f2e287-75a1-4da8-9439-17bc8094abd6', 'firstName', 'user.attribute'),
('19f2e287-75a1-4da8-9439-17bc8094abd6', 'true', 'userinfo.token.claim'),
('1b78e77d-0e46-4d01-ba2f-66d70d90a600', 'true', 'access.token.claim'),
('1b78e77d-0e46-4d01-ba2f-66d70d90a600', 'resource_access.${client_id}.roles', 'claim.name'),
('1b78e77d-0e46-4d01-ba2f-66d70d90a600', 'String', 'jsonType.label'),
('1b78e77d-0e46-4d01-ba2f-66d70d90a600', 'true', 'multivalued'),
('1b78e77d-0e46-4d01-ba2f-66d70d90a600', 'foo', 'user.attribute'),
('1bab73da-6254-453c-95cf-b77848ea3d11', 'true', 'access.token.claim'),
('1bab73da-6254-453c-95cf-b77848ea3d11', 'email', 'claim.name'),
('1bab73da-6254-453c-95cf-b77848ea3d11', 'true', 'id.token.claim'),
('1bab73da-6254-453c-95cf-b77848ea3d11', 'String', 'jsonType.label'),
('1bab73da-6254-453c-95cf-b77848ea3d11', 'email', 'user.attribute'),
('1bab73da-6254-453c-95cf-b77848ea3d11', 'true', 'userinfo.token.claim'),
('27b5ca7c-7400-46a3-b687-b34c4e42818e', 'true', 'access.token.claim'),
('27b5ca7c-7400-46a3-b687-b34c4e42818e', 'phone_number_verified', 'claim.name'),
('27b5ca7c-7400-46a3-b687-b34c4e42818e', 'true', 'id.token.claim'),
('27b5ca7c-7400-46a3-b687-b34c4e42818e', 'boolean', 'jsonType.label'),
('27b5ca7c-7400-46a3-b687-b34c4e42818e', 'phoneNumberVerified', 'user.attribute'),
('27b5ca7c-7400-46a3-b687-b34c4e42818e', 'true', 'userinfo.token.claim'),
('292788b8-0c6f-4a4e-91b4-86fe034b0a68', 'true', 'access.token.claim'),
('292788b8-0c6f-4a4e-91b4-86fe034b0a68', 'family_name', 'claim.name'),
('292788b8-0c6f-4a4e-91b4-86fe034b0a68', 'true', 'id.token.claim'),
('292788b8-0c6f-4a4e-91b4-86fe034b0a68', 'String', 'jsonType.label'),
('292788b8-0c6f-4a4e-91b4-86fe034b0a68', 'lastName', 'user.attribute'),
('292788b8-0c6f-4a4e-91b4-86fe034b0a68', 'true', 'userinfo.token.claim'),
('32fa0d3a-1e1e-4f71-82cc-8ed53c499725', 'true', 'access.token.claim'),
('32fa0d3a-1e1e-4f71-82cc-8ed53c499725', 'locale', 'claim.name'),
('32fa0d3a-1e1e-4f71-82cc-8ed53c499725', 'true', 'id.token.claim'),
('32fa0d3a-1e1e-4f71-82cc-8ed53c499725', 'String', 'jsonType.label'),
('32fa0d3a-1e1e-4f71-82cc-8ed53c499725', 'locale', 'user.attribute'),
('32fa0d3a-1e1e-4f71-82cc-8ed53c499725', 'true', 'userinfo.token.claim'),
('374544f8-117a-49cc-9677-eba55c9d3b52', 'true', 'access.token.claim'),
('374544f8-117a-49cc-9677-eba55c9d3b52', 'nickname', 'claim.name'),
('374544f8-117a-49cc-9677-eba55c9d3b52', 'true', 'id.token.claim'),
('374544f8-117a-49cc-9677-eba55c9d3b52', 'String', 'jsonType.label'),
('374544f8-117a-49cc-9677-eba55c9d3b52', 'nickname', 'user.attribute'),
('374544f8-117a-49cc-9677-eba55c9d3b52', 'true', 'userinfo.token.claim'),
('3d836b85-79a5-4b8c-b6a8-e24fd2b5550d', 'true', 'access.token.claim'),
('3d836b85-79a5-4b8c-b6a8-e24fd2b5550d', 'upn', 'claim.name'),
('3d836b85-79a5-4b8c-b6a8-e24fd2b5550d', 'true', 'id.token.claim'),
('3d836b85-79a5-4b8c-b6a8-e24fd2b5550d', 'String', 'jsonType.label'),
('3d836b85-79a5-4b8c-b6a8-e24fd2b5550d', 'username', 'user.attribute'),
('3d836b85-79a5-4b8c-b6a8-e24fd2b5550d', 'true', 'userinfo.token.claim'),
('4330cc23-942f-4e84-8db2-23ccb0b833bb', 'true', 'access.token.claim'),
('4330cc23-942f-4e84-8db2-23ccb0b833bb', 'picture', 'claim.name'),
('4330cc23-942f-4e84-8db2-23ccb0b833bb', 'true', 'id.token.claim'),
('4330cc23-942f-4e84-8db2-23ccb0b833bb', 'String', 'jsonType.label'),
('4330cc23-942f-4e84-8db2-23ccb0b833bb', 'picture', 'user.attribute'),
('4330cc23-942f-4e84-8db2-23ccb0b833bb', 'true', 'userinfo.token.claim'),
('4e8086e5-4afb-4295-b2b1-495a26084fa4', 'true', 'access.token.claim'),
('4e8086e5-4afb-4295-b2b1-495a26084fa4', 'website', 'claim.name'),
('4e8086e5-4afb-4295-b2b1-495a26084fa4', 'true', 'id.token.claim'),
('4e8086e5-4afb-4295-b2b1-495a26084fa4', 'String', 'jsonType.label'),
('4e8086e5-4afb-4295-b2b1-495a26084fa4', 'website', 'user.attribute'),
('4e8086e5-4afb-4295-b2b1-495a26084fa4', 'true', 'userinfo.token.claim'),
('60b82f12-4121-47f1-b4ec-386371245646', 'true', 'access.token.claim'),
('60b82f12-4121-47f1-b4ec-386371245646', 'groups', 'claim.name'),
('60b82f12-4121-47f1-b4ec-386371245646', 'true', 'id.token.claim'),
('60b82f12-4121-47f1-b4ec-386371245646', 'String', 'jsonType.label'),
('60b82f12-4121-47f1-b4ec-386371245646', 'true', 'multivalued'),
('60b82f12-4121-47f1-b4ec-386371245646', 'foo', 'user.attribute'),
('60b82f12-4121-47f1-b4ec-386371245646', 'true', 'userinfo.token.claim'),
('621688a7-85cb-4e3b-a859-9e581ff04fff', 'true', 'access.token.claim'),
('621688a7-85cb-4e3b-a859-9e581ff04fff', 'locale', 'claim.name'),
('621688a7-85cb-4e3b-a859-9e581ff04fff', 'true', 'id.token.claim'),
('621688a7-85cb-4e3b-a859-9e581ff04fff', 'String', 'jsonType.label'),
('621688a7-85cb-4e3b-a859-9e581ff04fff', 'locale', 'user.attribute'),
('621688a7-85cb-4e3b-a859-9e581ff04fff', 'true', 'userinfo.token.claim'),
('764e17a8-57c0-4a20-afe8-f7107a978209', 'true', 'access.token.claim'),
('764e17a8-57c0-4a20-afe8-f7107a978209', 'email_verified', 'claim.name'),
('764e17a8-57c0-4a20-afe8-f7107a978209', 'true', 'id.token.claim'),
('764e17a8-57c0-4a20-afe8-f7107a978209', 'boolean', 'jsonType.label'),
('764e17a8-57c0-4a20-afe8-f7107a978209', 'emailVerified', 'user.attribute'),
('764e17a8-57c0-4a20-afe8-f7107a978209', 'true', 'userinfo.token.claim'),
('7720ec4c-c548-43d2-b2a1-01980ce08741', 'true', 'access.token.claim'),
('7720ec4c-c548-43d2-b2a1-01980ce08741', 'email', 'claim.name'),
('7720ec4c-c548-43d2-b2a1-01980ce08741', 'true', 'id.token.claim'),
('7720ec4c-c548-43d2-b2a1-01980ce08741', 'String', 'jsonType.label'),
('7720ec4c-c548-43d2-b2a1-01980ce08741', 'email', 'user.attribute'),
('7720ec4c-c548-43d2-b2a1-01980ce08741', 'true', 'userinfo.token.claim'),
('79c0df13-c66e-4783-861c-b5c5819675de', 'true', 'access.token.claim'),
('79c0df13-c66e-4783-861c-b5c5819675de', 'middle_name', 'claim.name'),
('79c0df13-c66e-4783-861c-b5c5819675de', 'true', 'id.token.claim'),
('79c0df13-c66e-4783-861c-b5c5819675de', 'String', 'jsonType.label'),
('79c0df13-c66e-4783-861c-b5c5819675de', 'middleName', 'user.attribute'),
('79c0df13-c66e-4783-861c-b5c5819675de', 'true', 'userinfo.token.claim'),
('7e050725-6bf3-4221-a988-2d24cbb98dff', 'true', 'access.token.claim'),
('7e050725-6bf3-4221-a988-2d24cbb98dff', 'locale', 'claim.name'),
('7e050725-6bf3-4221-a988-2d24cbb98dff', 'true', 'id.token.claim'),
('7e050725-6bf3-4221-a988-2d24cbb98dff', 'String', 'jsonType.label'),
('7e050725-6bf3-4221-a988-2d24cbb98dff', 'locale', 'user.attribute'),
('7e050725-6bf3-4221-a988-2d24cbb98dff', 'true', 'userinfo.token.claim'),
('83e2bb47-86f4-4e2f-b7c2-f65d6840f422', 'true', 'access.token.claim'),
('83e2bb47-86f4-4e2f-b7c2-f65d6840f422', 'true', 'id.token.claim'),
('83e2bb47-86f4-4e2f-b7c2-f65d6840f422', 'true', 'userinfo.token.claim'),
('84b0fee5-2034-44af-a452-7c765a4f8ea0', 'true', 'access.token.claim'),
('84b0fee5-2034-44af-a452-7c765a4f8ea0', 'picture', 'claim.name'),
('84b0fee5-2034-44af-a452-7c765a4f8ea0', 'true', 'id.token.claim'),
('84b0fee5-2034-44af-a452-7c765a4f8ea0', 'String', 'jsonType.label'),
('84b0fee5-2034-44af-a452-7c765a4f8ea0', 'picture', 'user.attribute'),
('84b0fee5-2034-44af-a452-7c765a4f8ea0', 'true', 'userinfo.token.claim'),
('84f389cb-b192-4504-8b45-5b1e229daa75', 'Role', 'attribute.name'),
('84f389cb-b192-4504-8b45-5b1e229daa75', 'Basic', 'attribute.nameformat'),
('84f389cb-b192-4504-8b45-5b1e229daa75', 'false', 'single'),
('9046ad67-c304-4de0-97a1-04bb2d26ca5a', 'true', 'access.token.claim'),
('9046ad67-c304-4de0-97a1-04bb2d26ca5a', 'updated_at', 'claim.name'),
('9046ad67-c304-4de0-97a1-04bb2d26ca5a', 'true', 'id.token.claim'),
('9046ad67-c304-4de0-97a1-04bb2d26ca5a', 'String', 'jsonType.label'),
('9046ad67-c304-4de0-97a1-04bb2d26ca5a', 'updatedAt', 'user.attribute'),
('9046ad67-c304-4de0-97a1-04bb2d26ca5a', 'true', 'userinfo.token.claim'),
('9626c352-af07-4c7d-a0f9-b38ecf035757', 'true', 'access.token.claim'),
('9626c352-af07-4c7d-a0f9-b38ecf035757', 'gender', 'claim.name'),
('9626c352-af07-4c7d-a0f9-b38ecf035757', 'true', 'id.token.claim'),
('9626c352-af07-4c7d-a0f9-b38ecf035757', 'String', 'jsonType.label'),
('9626c352-af07-4c7d-a0f9-b38ecf035757', 'gender', 'user.attribute'),
('9626c352-af07-4c7d-a0f9-b38ecf035757', 'true', 'userinfo.token.claim'),
('99265266-2e88-4738-9d40-d5d18c744710', 'true', 'access.token.claim'),
('99265266-2e88-4738-9d40-d5d18c744710', 'true', 'id.token.claim'),
('99265266-2e88-4738-9d40-d5d18c744710', 'country', 'user.attribute.country'),
('99265266-2e88-4738-9d40-d5d18c744710', 'formatted', 'user.attribute.formatted'),
('99265266-2e88-4738-9d40-d5d18c744710', 'locality', 'user.attribute.locality'),
('99265266-2e88-4738-9d40-d5d18c744710', 'postal_code', 'user.attribute.postal_code'),
('99265266-2e88-4738-9d40-d5d18c744710', 'region', 'user.attribute.region'),
('99265266-2e88-4738-9d40-d5d18c744710', 'street', 'user.attribute.street'),
('99265266-2e88-4738-9d40-d5d18c744710', 'true', 'userinfo.token.claim'),
('9b12e38d-9e12-4592-8322-03c5844d64c1', 'true', 'access.token.claim'),
('9b12e38d-9e12-4592-8322-03c5844d64c1', 'phone_number', 'claim.name'),
('9b12e38d-9e12-4592-8322-03c5844d64c1', 'true', 'id.token.claim'),
('9b12e38d-9e12-4592-8322-03c5844d64c1', 'String', 'jsonType.label'),
('9b12e38d-9e12-4592-8322-03c5844d64c1', 'phoneNumber', 'user.attribute'),
('9b12e38d-9e12-4592-8322-03c5844d64c1', 'true', 'userinfo.token.claim'),
('a1a53418-45da-4488-b684-f55a2e2ff17b', 'true', 'access.token.claim'),
('a1a53418-45da-4488-b684-f55a2e2ff17b', 'resource_access.${client_id}.roles', 'claim.name'),
('a1a53418-45da-4488-b684-f55a2e2ff17b', 'String', 'jsonType.label'),
('a1a53418-45da-4488-b684-f55a2e2ff17b', 'true', 'multivalued'),
('a1a53418-45da-4488-b684-f55a2e2ff17b', 'foo', 'user.attribute'),
('a68c83c9-b4a1-4f20-927b-9726a2ceaa39', 'true', 'access.token.claim'),
('a68c83c9-b4a1-4f20-927b-9726a2ceaa39', 'given_name', 'claim.name'),
('a68c83c9-b4a1-4f20-927b-9726a2ceaa39', 'true', 'id.token.claim'),
('a68c83c9-b4a1-4f20-927b-9726a2ceaa39', 'String', 'jsonType.label'),
('a68c83c9-b4a1-4f20-927b-9726a2ceaa39', 'firstName', 'user.attribute'),
('a68c83c9-b4a1-4f20-927b-9726a2ceaa39', 'true', 'userinfo.token.claim'),
('abee168e-25ff-4eba-8731-2273f1389109', 'true', 'access.token.claim'),
('abee168e-25ff-4eba-8731-2273f1389109', 'true', 'id.token.claim'),
('abee168e-25ff-4eba-8731-2273f1389109', 'true', 'userinfo.token.claim'),
('acb6e0bc-b39d-4a9c-9176-60be4c03d0e5', 'true', 'access.token.claim'),
('acb6e0bc-b39d-4a9c-9176-60be4c03d0e5', 'family_name', 'claim.name'),
('acb6e0bc-b39d-4a9c-9176-60be4c03d0e5', 'true', 'id.token.claim'),
('acb6e0bc-b39d-4a9c-9176-60be4c03d0e5', 'String', 'jsonType.label'),
('acb6e0bc-b39d-4a9c-9176-60be4c03d0e5', 'lastName', 'user.attribute'),
('acb6e0bc-b39d-4a9c-9176-60be4c03d0e5', 'true', 'userinfo.token.claim'),
('af8aeecc-44f2-4638-b5e8-4d32b2068c70', 'true', 'access.token.claim'),
('af8aeecc-44f2-4638-b5e8-4d32b2068c70', 'birthdate', 'claim.name'),
('af8aeecc-44f2-4638-b5e8-4d32b2068c70', 'true', 'id.token.claim'),
('af8aeecc-44f2-4638-b5e8-4d32b2068c70', 'String', 'jsonType.label'),
('af8aeecc-44f2-4638-b5e8-4d32b2068c70', 'birthdate', 'user.attribute'),
('af8aeecc-44f2-4638-b5e8-4d32b2068c70', 'true', 'userinfo.token.claim'),
('b52bef34-1216-4ed9-95fc-fa9c62bc3173', 'true', 'access.token.claim'),
('b52bef34-1216-4ed9-95fc-fa9c62bc3173', 'nickname', 'claim.name'),
('b52bef34-1216-4ed9-95fc-fa9c62bc3173', 'true', 'id.token.claim'),
('b52bef34-1216-4ed9-95fc-fa9c62bc3173', 'String', 'jsonType.label'),
('b52bef34-1216-4ed9-95fc-fa9c62bc3173', 'nickname', 'user.attribute'),
('b52bef34-1216-4ed9-95fc-fa9c62bc3173', 'true', 'userinfo.token.claim'),
('c2e5d260-8711-4cd3-89a0-5525cd21cb26', 'true', 'access.token.claim'),
('c2e5d260-8711-4cd3-89a0-5525cd21cb26', 'middle_name', 'claim.name'),
('c2e5d260-8711-4cd3-89a0-5525cd21cb26', 'true', 'id.token.claim'),
('c2e5d260-8711-4cd3-89a0-5525cd21cb26', 'String', 'jsonType.label'),
('c2e5d260-8711-4cd3-89a0-5525cd21cb26', 'middleName', 'user.attribute'),
('c2e5d260-8711-4cd3-89a0-5525cd21cb26', 'true', 'userinfo.token.claim'),
('c6c7d390-fa22-4203-9906-34def1f6f846', 'true', 'access.token.claim'),
('c6c7d390-fa22-4203-9906-34def1f6f846', 'updated_at', 'claim.name'),
('c6c7d390-fa22-4203-9906-34def1f6f846', 'true', 'id.token.claim'),
('c6c7d390-fa22-4203-9906-34def1f6f846', 'String', 'jsonType.label'),
('c6c7d390-fa22-4203-9906-34def1f6f846', 'updatedAt', 'user.attribute'),
('c6c7d390-fa22-4203-9906-34def1f6f846', 'true', 'userinfo.token.claim'),
('c91a10a0-a381-4be2-aeb8-a25f89ebcf48', 'Role', 'attribute.name'),
('c91a10a0-a381-4be2-aeb8-a25f89ebcf48', 'Basic', 'attribute.nameformat'),
('c91a10a0-a381-4be2-aeb8-a25f89ebcf48', 'false', 'single'),
('d242eb86-9a72-4004-b347-9c2d75c089b1', 'true', 'access.token.claim'),
('d242eb86-9a72-4004-b347-9c2d75c089b1', 'locale', 'claim.name'),
('d242eb86-9a72-4004-b347-9c2d75c089b1', 'true', 'id.token.claim'),
('d242eb86-9a72-4004-b347-9c2d75c089b1', 'String', 'jsonType.label'),
('d242eb86-9a72-4004-b347-9c2d75c089b1', 'locale', 'user.attribute'),
('d242eb86-9a72-4004-b347-9c2d75c089b1', 'true', 'userinfo.token.claim'),
('de0c74d1-1703-442e-b7f9-ba7a705a7c69', 'true', 'access.token.claim'),
('de0c74d1-1703-442e-b7f9-ba7a705a7c69', 'preferred_username', 'claim.name'),
('de0c74d1-1703-442e-b7f9-ba7a705a7c69', 'true', 'id.token.claim'),
('de0c74d1-1703-442e-b7f9-ba7a705a7c69', 'String', 'jsonType.label'),
('de0c74d1-1703-442e-b7f9-ba7a705a7c69', 'username', 'user.attribute'),
('de0c74d1-1703-442e-b7f9-ba7a705a7c69', 'true', 'userinfo.token.claim'),
('df93d932-1645-4a48-a964-c132903c2dcf', 'true', 'access.token.claim'),
('df93d932-1645-4a48-a964-c132903c2dcf', 'preferred_username', 'claim.name'),
('df93d932-1645-4a48-a964-c132903c2dcf', 'true', 'id.token.claim'),
('df93d932-1645-4a48-a964-c132903c2dcf', 'String', 'jsonType.label'),
('df93d932-1645-4a48-a964-c132903c2dcf', 'username', 'user.attribute'),
('df93d932-1645-4a48-a964-c132903c2dcf', 'true', 'userinfo.token.claim'),
('e1ebf0e2-e5e6-404e-94c7-a450ba9252d9', 'true', 'access.token.claim'),
('e1ebf0e2-e5e6-404e-94c7-a450ba9252d9', 'groups', 'claim.name'),
('e1ebf0e2-e5e6-404e-94c7-a450ba9252d9', 'true', 'id.token.claim'),
('e1ebf0e2-e5e6-404e-94c7-a450ba9252d9', 'String', 'jsonType.label'),
('e1ebf0e2-e5e6-404e-94c7-a450ba9252d9', 'true', 'multivalued'),
('e1ebf0e2-e5e6-404e-94c7-a450ba9252d9', 'foo', 'user.attribute'),
('e49ceac0-6bb7-43e9-99a3-9439b5417ef0', 'true', 'access.token.claim'),
('e49ceac0-6bb7-43e9-99a3-9439b5417ef0', 'website', 'claim.name'),
('e49ceac0-6bb7-43e9-99a3-9439b5417ef0', 'true', 'id.token.claim'),
('e49ceac0-6bb7-43e9-99a3-9439b5417ef0', 'String', 'jsonType.label'),
('e49ceac0-6bb7-43e9-99a3-9439b5417ef0', 'website', 'user.attribute'),
('e49ceac0-6bb7-43e9-99a3-9439b5417ef0', 'true', 'userinfo.token.claim'),
('e7da8893-f0ac-4d48-b995-f95857358e4c', 'true', 'access.token.claim'),
('e7da8893-f0ac-4d48-b995-f95857358e4c', 'phone_number_verified', 'claim.name'),
('e7da8893-f0ac-4d48-b995-f95857358e4c', 'true', 'id.token.claim'),
('e7da8893-f0ac-4d48-b995-f95857358e4c', 'boolean', 'jsonType.label'),
('e7da8893-f0ac-4d48-b995-f95857358e4c', 'phoneNumberVerified', 'user.attribute'),
('e7da8893-f0ac-4d48-b995-f95857358e4c', 'true', 'userinfo.token.claim'),
('e80b6ff2-25c1-4f47-b455-7cbce8c337b8', 'true', 'access.token.claim'),
('e80b6ff2-25c1-4f47-b455-7cbce8c337b8', 'email_verified', 'claim.name'),
('e80b6ff2-25c1-4f47-b455-7cbce8c337b8', 'true', 'id.token.claim'),
('e80b6ff2-25c1-4f47-b455-7cbce8c337b8', 'boolean', 'jsonType.label'),
('e80b6ff2-25c1-4f47-b455-7cbce8c337b8', 'emailVerified', 'user.attribute'),
('e80b6ff2-25c1-4f47-b455-7cbce8c337b8', 'true', 'userinfo.token.claim'),
('ec261033-2e41-4422-bad4-928fed04059a', 'true', 'access.token.claim'),
('ec261033-2e41-4422-bad4-928fed04059a', 'true', 'id.token.claim'),
('ec261033-2e41-4422-bad4-928fed04059a', 'country', 'user.attribute.country'),
('ec261033-2e41-4422-bad4-928fed04059a', 'formatted', 'user.attribute.formatted'),
('ec261033-2e41-4422-bad4-928fed04059a', 'locality', 'user.attribute.locality'),
('ec261033-2e41-4422-bad4-928fed04059a', 'postal_code', 'user.attribute.postal_code'),
('ec261033-2e41-4422-bad4-928fed04059a', 'region', 'user.attribute.region'),
('ec261033-2e41-4422-bad4-928fed04059a', 'street', 'user.attribute.street'),
('ec261033-2e41-4422-bad4-928fed04059a', 'true', 'userinfo.token.claim'),
('ec38aecf-5fe3-4d2b-9f3c-78a71276e0da', 'true', 'access.token.claim'),
('ec38aecf-5fe3-4d2b-9f3c-78a71276e0da', 'profile', 'claim.name'),
('ec38aecf-5fe3-4d2b-9f3c-78a71276e0da', 'true', 'id.token.claim'),
('ec38aecf-5fe3-4d2b-9f3c-78a71276e0da', 'String', 'jsonType.label'),
('ec38aecf-5fe3-4d2b-9f3c-78a71276e0da', 'profile', 'user.attribute'),
('ec38aecf-5fe3-4d2b-9f3c-78a71276e0da', 'true', 'userinfo.token.claim'),
('f5ae6cd1-ebe8-4e51-ad7f-d01a071a6937', 'true', 'access.token.claim'),
('f5ae6cd1-ebe8-4e51-ad7f-d01a071a6937', 'profile', 'claim.name'),
('f5ae6cd1-ebe8-4e51-ad7f-d01a071a6937', 'true', 'id.token.claim'),
('f5ae6cd1-ebe8-4e51-ad7f-d01a071a6937', 'String', 'jsonType.label'),
('f5ae6cd1-ebe8-4e51-ad7f-d01a071a6937', 'profile', 'user.attribute'),
('f5ae6cd1-ebe8-4e51-ad7f-d01a071a6937', 'true', 'userinfo.token.claim'),
('f88ff5d2-c01c-4810-9022-ff7a2665f05a', 'true', 'access.token.claim'),
('f88ff5d2-c01c-4810-9022-ff7a2665f05a', 'upn', 'claim.name'),
('f88ff5d2-c01c-4810-9022-ff7a2665f05a', 'true', 'id.token.claim'),
('f88ff5d2-c01c-4810-9022-ff7a2665f05a', 'String', 'jsonType.label'),
('f88ff5d2-c01c-4810-9022-ff7a2665f05a', 'username', 'user.attribute'),
('f88ff5d2-c01c-4810-9022-ff7a2665f05a', 'true', 'userinfo.token.claim'),
('feacd273-1971-47dd-9dec-d3e2239b3a3d', 'true', 'access.token.claim'),
('feacd273-1971-47dd-9dec-d3e2239b3a3d', 'phone_number', 'claim.name'),
('feacd273-1971-47dd-9dec-d3e2239b3a3d', 'true', 'id.token.claim'),
('feacd273-1971-47dd-9dec-d3e2239b3a3d', 'String', 'jsonType.label'),
('feacd273-1971-47dd-9dec-d3e2239b3a3d', 'phoneNumber', 'user.attribute'),
('feacd273-1971-47dd-9dec-d3e2239b3a3d', 'true', 'userinfo.token.claim');

-- --------------------------------------------------------

--
-- Table structure for table `REALM`
--

CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REALM`
--

INSERT INTO `REALM` (`ID`, `ACCESS_CODE_LIFESPAN`, `USER_ACTION_LIFESPAN`, `ACCESS_TOKEN_LIFESPAN`, `ACCOUNT_THEME`, `ADMIN_THEME`, `EMAIL_THEME`, `ENABLED`, `EVENTS_ENABLED`, `EVENTS_EXPIRATION`, `LOGIN_THEME`, `NAME`, `NOT_BEFORE`, `PASSWORD_POLICY`, `REGISTRATION_ALLOWED`, `REMEMBER_ME`, `RESET_PASSWORD_ALLOWED`, `SOCIAL`, `SSL_REQUIRED`, `SSO_IDLE_TIMEOUT`, `SSO_MAX_LIFESPAN`, `UPDATE_PROFILE_ON_SOC_LOGIN`, `VERIFY_EMAIL`, `MASTER_ADMIN_CLIENT`, `LOGIN_LIFESPAN`, `INTERNATIONALIZATION_ENABLED`, `DEFAULT_LOCALE`, `REG_EMAIL_AS_USERNAME`, `ADMIN_EVENTS_ENABLED`, `ADMIN_EVENTS_DETAILS_ENABLED`, `EDIT_USERNAME_ALLOWED`, `OTP_POLICY_COUNTER`, `OTP_POLICY_WINDOW`, `OTP_POLICY_PERIOD`, `OTP_POLICY_DIGITS`, `OTP_POLICY_ALG`, `OTP_POLICY_TYPE`, `BROWSER_FLOW`, `REGISTRATION_FLOW`, `DIRECT_GRANT_FLOW`, `RESET_CREDENTIALS_FLOW`, `CLIENT_AUTH_FLOW`, `OFFLINE_SESSION_IDLE_TIMEOUT`, `REVOKE_REFRESH_TOKEN`, `ACCESS_TOKEN_LIFE_IMPLICIT`, `LOGIN_WITH_EMAIL_ALLOWED`, `DUPLICATE_EMAILS_ALLOWED`, `DOCKER_AUTH_FLOW`, `REFRESH_TOKEN_MAX_REUSE`, `ALLOW_USER_MANAGED_ACCESS`, `SSO_MAX_LIFESPAN_REMEMBER_ME`, `SSO_IDLE_TIMEOUT_REMEMBER_ME`) VALUES
('master', 60, 300, 60, NULL, NULL, NULL, b'1', b'0', 0, NULL, 'master', 0, NULL, b'0', b'0', b'0', b'0', 'EXTERNAL', 1800, 36000, b'0', b'0', 'bc72954a-b973-4654-9a9d-f7e8db39498c', 1800, b'0', NULL, b'0', b'0', b'0', b'0', 0, 1, 30, 6, 'HmacSHA1', 'totp', '53a4e03e-3ed9-4d1c-9542-e35c7ef24f8d', '9d2e5ee2-2777-4d36-beb6-119f53850624', '9b92f10b-3f0e-4f34-a478-9ffa0be1bd3c', '695f9320-7fbf-40b3-b669-3250656fd3b1', '54d06c50-ef99-496b-99b0-ce192cd2ed81', 2592000, b'0', 900, b'1', b'0', 'c07cd2a3-0a72-4800-894a-e334c0a5c828', 0, b'0', 0, 0),
('myrealm', 60, 300, 300, NULL, NULL, NULL, b'1', b'0', 0, NULL, 'myrealm', 0, NULL, b'0', b'0', b'0', b'0', 'EXTERNAL', 1800, 36000, b'0', b'0', 'ca7bf392-db45-4f3b-91ec-89745a6b9347', 1800, b'0', NULL, b'0', b'0', b'0', b'0', 0, 1, 30, 6, 'HmacSHA1', 'totp', 'f6c29c7b-eff3-4db1-a9c6-f80fb3c5d918', 'd7e1e1bf-8986-4259-9eb1-dd3dd3f6784a', '66e8f4cc-c25c-4de6-88db-5ebc6a9914f4', '1c7e7141-12d3-414a-8aac-fa41934cdfc7', 'a5b69c5c-c486-4a2a-86d2-f0ba7a8f21db', 2592000, b'0', 900, b'1', b'0', '3bec6925-ceba-4aae-9a4a-e665ca7fea57', 0, b'0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `REALM_ATTRIBUTE`
--

CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

INSERT INTO `REALM_ATTRIBUTE` (`NAME`, `VALUE`, `REALM_ID`) VALUES
('actionTokenGeneratedByAdminLifespan', '43200', 'myrealm'),
('actionTokenGeneratedByUserLifespan', '300', 'myrealm'),
('bruteForceProtected', 'false', 'master'),
('bruteForceProtected', 'false', 'myrealm'),
('clientOfflineSessionIdleTimeout', '0', 'myrealm'),
('clientOfflineSessionMaxLifespan', '0', 'myrealm'),
('clientSessionIdleTimeout', '0', 'myrealm'),
('clientSessionMaxLifespan', '0', 'myrealm'),
('displayName', 'Keycloak', 'master'),
('displayNameHtml', '<div class=\"kc-logo-text\"><span>Keycloak</span></div>', 'master'),
('failureFactor', '30', 'master'),
('failureFactor', '30', 'myrealm'),
('maxDeltaTimeSeconds', '43200', 'master'),
('maxDeltaTimeSeconds', '43200', 'myrealm'),
('maxFailureWaitSeconds', '900', 'master'),
('maxFailureWaitSeconds', '900', 'myrealm'),
('minimumQuickLoginWaitSeconds', '60', 'master'),
('minimumQuickLoginWaitSeconds', '60', 'myrealm'),
('offlineSessionMaxLifespan', '5184000', 'master'),
('offlineSessionMaxLifespan', '5184000', 'myrealm'),
('offlineSessionMaxLifespanEnabled', 'false', 'master'),
('offlineSessionMaxLifespanEnabled', 'false', 'myrealm'),
('permanentLockout', 'false', 'master'),
('permanentLockout', 'false', 'myrealm'),
('quickLoginCheckMilliSeconds', '1000', 'master'),
('quickLoginCheckMilliSeconds', '1000', 'myrealm'),
('waitIncrementSeconds', '60', 'master'),
('waitIncrementSeconds', '60', 'myrealm'),
('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'myrealm'),
('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'myrealm'),
('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'myrealm'),
('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'myrealm'),
('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'myrealm'),
('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'myrealm'),
('webAuthnPolicyCreateTimeout', '0', 'myrealm'),
('webAuthnPolicyCreateTimeoutPasswordless', '0', 'myrealm'),
('webAuthnPolicyRequireResidentKey', 'not specified', 'myrealm'),
('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'myrealm'),
('webAuthnPolicyRpEntityName', 'keycloak', 'myrealm'),
('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'myrealm'),
('webAuthnPolicyRpId', '', 'myrealm'),
('webAuthnPolicyRpIdPasswordless', '', 'myrealm'),
('webAuthnPolicySignatureAlgorithms', 'ES256', 'myrealm'),
('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'myrealm'),
('webAuthnPolicyUserVerificationRequirement', 'not specified', 'myrealm'),
('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'myrealm'),
('_browser_header.contentSecurityPolicy', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';', 'master'),
('_browser_header.contentSecurityPolicy', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';', 'myrealm'),
('_browser_header.contentSecurityPolicyReportOnly', '', 'master'),
('_browser_header.contentSecurityPolicyReportOnly', '', 'myrealm'),
('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'master'),
('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'myrealm'),
('_browser_header.xContentTypeOptions', 'nosniff', 'master'),
('_browser_header.xContentTypeOptions', 'nosniff', 'myrealm'),
('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master'),
('_browser_header.xFrameOptions', 'SAMEORIGIN', 'myrealm'),
('_browser_header.xRobotsTag', 'none', 'master'),
('_browser_header.xRobotsTag', 'none', 'myrealm'),
('_browser_header.xXSSProtection', '1; mode=block', 'master'),
('_browser_header.xXSSProtection', '1; mode=block', 'myrealm');

-- --------------------------------------------------------

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

INSERT INTO `REALM_DEFAULT_ROLES` (`REALM_ID`, `ROLE_ID`) VALUES
('master', '195d9b4a-8781-484b-860b-e1371a25c2c4'),
('myrealm', 'a218f51c-cb1a-43e7-b30f-530351bd0820'),
('myrealm', 'd4f6f28f-e200-4ca1-862d-c13b51347f90'),
('master', 'f173aec1-599d-40c2-a5a3-36d6e76be492');

-- --------------------------------------------------------

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

INSERT INTO `REALM_EVENTS_LISTENERS` (`REALM_ID`, `VALUE`) VALUES
('master', 'jboss-logging'),
('myrealm', 'jboss-logging');

-- --------------------------------------------------------

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

INSERT INTO `REALM_REQUIRED_CREDENTIAL` (`TYPE`, `FORM_LABEL`, `INPUT`, `SECRET`, `REALM_ID`) VALUES
('password', 'password', b'1', b'1', 'master'),
('password', 'password', b'1', b'1', 'myrealm');

-- --------------------------------------------------------

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REDIRECT_URIS`
--

CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REDIRECT_URIS`
--

INSERT INTO `REDIRECT_URIS` (`CLIENT_ID`, `VALUE`) VALUES
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', '/admin/myrealm/console/*'),
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', '/realms/master/account/*'),
('13ddf38d-ef75-4de7-a4e7-5f81b5649b43', '/realms/master/account/*'),
('37b72042-6743-430a-969e-93b37410e404', '/realms/myrealm/account/*'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', ''),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', '*'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', '/realms/myrealm/account/*'),
('e05b255a-e287-427b-8837-13b3380af674', '/admin/master/console/*');

-- --------------------------------------------------------

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

INSERT INTO `REQUIRED_ACTION_PROVIDER` (`ID`, `ALIAS`, `NAME`, `REALM_ID`, `ENABLED`, `DEFAULT_ACTION`, `PROVIDER_ID`, `PRIORITY`) VALUES
('1579a25e-e1cb-4db6-ac0c-83b8f5a21f3d', 'terms_and_conditions', 'Terms and Conditions', 'master', b'0', b'0', 'terms_and_conditions', 20),
('2e5a67b9-d91a-41b4-a58d-2e3ec51b739f', 'VERIFY_EMAIL', 'Verify Email', 'master', b'1', b'0', 'VERIFY_EMAIL', 50),
('2fc7f2fc-dae4-42db-8c6b-b121008155a4', 'update_user_locale', 'Update User Locale', 'master', b'1', b'0', 'update_user_locale', 1000),
('52659842-5329-4081-addb-13773072b1e8', 'UPDATE_PROFILE', 'Update Profile', 'master', b'1', b'0', 'UPDATE_PROFILE', 40),
('63c82759-387c-478a-accb-198edfa05c1b', 'VERIFY_EMAIL', 'Verify Email', 'myrealm', b'1', b'0', 'VERIFY_EMAIL', 50),
('98a7af43-9348-45d2-b682-e11f24d5a70a', 'update_user_locale', 'Update User Locale', 'myrealm', b'1', b'0', 'update_user_locale', 1000),
('994c1ddc-78c5-42e8-98a4-dfe5feac5f0b', 'UPDATE_PASSWORD', 'Update Password', 'myrealm', b'1', b'0', 'UPDATE_PASSWORD', 30),
('be1274bb-5b90-4908-8246-74a7cd1d3d2b', 'delete_account', 'Delete Account', 'myrealm', b'0', b'0', 'delete_account', 60),
('dbc8f7d8-a6a6-4eb0-a458-17b6a9c6de8f', 'UPDATE_PROFILE', 'Update Profile', 'myrealm', b'1', b'0', 'UPDATE_PROFILE', 40),
('ec50dd65-cbc8-4cf5-8236-917200176aed', 'CONFIGURE_TOTP', 'Configure OTP', 'master', b'1', b'0', 'CONFIGURE_TOTP', 10),
('f007ace6-2474-4a68-af1d-302b0cd80451', 'UPDATE_PASSWORD', 'Update Password', 'master', b'1', b'0', 'UPDATE_PASSWORD', 30),
('f5ca7a3c-d21d-4702-9bab-959fe32e1a9a', 'terms_and_conditions', 'Terms and Conditions', 'myrealm', b'0', b'0', 'terms_and_conditions', 20),
('f6ac8d2f-bbe9-4540-a818-07d8e2102558', 'CONFIGURE_TOTP', 'Configure OTP', 'myrealm', b'1', b'0', 'CONFIGURE_TOTP', 10),
('fd95956d-5445-41d6-9f7f-e3aa038f0046', 'delete_account', 'Delete Account', 'master', b'0', b'0', 'delete_account', 60);

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_POLICY`
--

CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SCOPE`
--

CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER`
--

CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_URIS`
--

CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SCOPE_MAPPING`
--

CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SCOPE_MAPPING`
--

INSERT INTO `SCOPE_MAPPING` (`CLIENT_ID`, `ROLE_ID`) VALUES
('0fc8ce1e-76de-4ae2-8f73-cd38c669863f', '97d6871f-dee1-4ad2-b08f-f7c7b8b62f15'),
('e02d090f-d51d-4c07-9874-6fb8e19b7f6a', 'f7cde267-aed9-46b3-aa11-6a01c3ef9ce7');

-- --------------------------------------------------------

--
-- Table structure for table `SCOPE_POLICY`
--

CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `talk`
--

CREATE TABLE `talk` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `abstract` text,
  `notes` text,
  `created_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talk`
--

INSERT INTO `talk` (`id`, `title`, `abstract`, `notes`, `created_by`) VALUES
(1, 'NodeJS, ML, K8s and Unethical Face Recognition', 'How nice would it be to be able to remember everyone’s name? What if you could just walk into a room and know everyone’s Twitter handle? What if you could give them a score to decide if you should have a conversation with them or not? Kubernetes is a great tool that is being used more and more for deploying applications, and it can also be used in the context of machine learning. In this talk, the speaker will demonstrate how to use NodeJs, a touch of machine learning and a sprinkle of Kubernetes to recognize people in a crowd.\r\n\r\nThis talk is about the various technologies that were used for this demo inspired by the Black Mirror show. It’s about the tech... and also why you shouldn\'t build it.\r\n', 'I was inspired by the Black Mirror episode NoseDive (https://en.wikipedia.org/wiki/Nosedive_(Black_Mirror)) and decided to see if I could reproduce something similar. Essentially, this presentation is about how I built an application to rate my Twitter followers to see if I should have a conversation with them or not. Of course, all of this is the \"unethical\" part of this presentation. \r\nThis talk has both a very technical aspect, in which I demonstrate various technologies that I used to build the application such as face recognition, microservices and messaging queues. It also has a nice moral in which I also explain the pitfalls of unethical machine learning and what we should do, as software developers, to be aware and careful about those biases that might slip into our applications.\r\n\r\n\r\n--\r\nPoints covered during this presentation:\r\nConnecting to a data source\r\nFace Recognition with JavaScript\r\nSentiment Analysis\r\nContainers and Microservices\r\nMessaging Queues\r\nKubernetes\r\nA word about unethical machine learning\r\n', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(3, 'Containerization for Software Developers', 'The end is nigh. Your application is almost ready, and you will need to deploy it. And with the deployment, the endless tweaking to get everything running on your production servers. If only there were a way to test everything first. That is where containers will come in to save the day. With containers, you not only run your code in an environment similar to the production server, but you also run your code in precisely the same environment. In this talk, the attendees will learn about how to create container friendly applications, how to use containers to share their code with their team and finally, how to use those same containers to deploy to a production server with minimal efforts. \n', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(4, 'Power-Up With Clouds and Pipelines', 'Mario is a software developer. He used to send his code to Luigi so he could deploy them on their servers, but he now wants to embrace DevOps principles and work together with Luigi to deploy his applications. This is where Tekton Pipelines will come to help them. Tekton is a flexible, Kubernetes native open source CI/CD framework that enables automating deployments across multiple platforms—including Kubernetes, serverless, and VMs—by abstracting away the underlying details. During this talk, the attendees will learn some of the Tekton resources, how to install the pipelines and how to run them for building, testing and deploying containerized applications on their clusters.\n', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(5, 'Kubernetes Kitchen', 'You’ve been to a restaurant before, right? Have you noticed how everything is structured? Everyone has a job and there is a chain of command. You can’t just walk into the kitchen and tell the cook how you want your steak done.  Kubernetes is actually very similar to this. You will deploy some pods that do specific things and set the rules of communications that dictate how they all talk to each other. By expanding on the idea of a restaurant, the speaker will slowly introduce some of the basic concepts behind modern devops in a fun and easy to understand way. The attendees will come out of this talk with a whole new perspective on what kubernetes does and how to apply this in their software development practices.', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(6, 'Patternfly Passes with Flying Colours', 'There are many UI frameworks to help you build websites quickly out there, but most people tend to fall back to the default they are used to and forget about other options. Patternfly is a robust framework that has support for React out of the box. It provides software development teams with a flexible and accessible components collection. The provided design and UX guidelines also help your team make better decisions. In this presentation, the speaker will go through some of the design principles behind the Patternfly framework and how to build a React application using Patternfly components.\n', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(7, 'Hands-On Intro To Tekton Pipelines', 'The ultimate goal of software agility is to be able to deploy frequently and rapidly. To do so, software developers need the appropriate tools. This is where CI/CD will come into play. By automating the processes related to application deployment, software developers can ensure more frequent and robust software deployments.\n\nThere are many continuous delivery solutions out there, but one is starting to stand out by its truly cloud-native approach. Tekton is an open-source, cloud-native framework for creating CI/CD systems. Its architecture, using composable, reproducible and declarative blocks, makes it easy for software developers to create and maintain their pipelines to automate their software deployment. As Tekton runs natively on Kubernetes and is backed by large players like Google and Red Hat, it is obviously an appealing choice for developers.', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(8, 'JavaScript Powered Smart Home With (Almost) No Code', 'Smart things around the house are nice, but let’s face it, most of these devices are rather dumb. An application can typically control the machines, but they can’t make decisions independently. To do so, you need to add some sensors and find a way to have your controllers communicate with each other. To manage all the information coming from these sensors, you will need an application, and this is where Node-RED comes into play. This low-code programming tool lets the user build flows for event-driven applications. It makes it easy to process events, manipulate data and trigger other events. Once all of the flows are detailed, the runtime can be deployed locally or in the cloud quickly with a container. In this presentation, the attendees will see how to use Node-RED and low-code technology to make smart devices smarter with additional sensors.', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(9, 'Other/Custom talk', '', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(10, 'Computing at the Edge with Node-RED', 'The cloud revolution brought many advantages, and as software developers, we could barely do without it anymore. Thanks to cloud services and cheaper connected chipsets,  we’ve seen an emergence of IoT devices with more and more capabilities. As more and more things are getting connected, we see some limitations inherent to the cloud. The latency that it brings, as small as it is, could have dramatic outcomes. It is in this quest of faster response times that Edge computing comes to help us. Some mission-critical calculations can be done quickly with shorter response times by bringing some computing power closer to the sensors. In this presentation, the attendees will see how Node-RED can be used in the context of edge computing with the additional benefit of a low-code interface.', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(11, 'Docker and Kubernetes for Software Developers', 'So you need to build a cloud native application but don\'t know where to start? You now need to containerize and deploy to Kubernetes but don\'t know where to get started? This workshop is for you. In this full-day workshop, the attendees will start with a code base still in development mode and slowly break it down in pieces. They will learn how to package those pieces in containers. And finally, they will learn how to deploy them in a Kubernetes cluster. This workshop is a mix of hands-on and theory and should teach the basics of cloud native development to software developers turning them into DevOps wizards.', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(12, 'Container Best Practices For Full-Stack JS Apps', 'Sure, you can start FROM node and COPY . ., but is that the best way to build a container for a Node.js application? And what about your front-end? Using environment variables in nginx, building rootless containers and ensuring that your containers are secure can be tricky. Tricky, but not that hard. In this talk, the attendees will learn about the best practices to use in building containers for both the front-end and back-end.', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(13, 'Building CLI Tools with Node.js', '', '', 'a515ae23-5e28-408b-ab95-72494a490afc'),
(14, 'Application Metamorphosis with KafkaJS', 'As you enter the world of microservices, you will need a way to have easy communication across your containers. As a JavaScript developer, you might be tempted to use REST APIs across the board. Express is certainly a familiar framework, but it might now be the best choice. Enter KafkaJS. Using Kafka is a tool to ensure fluid communication across all of your microservices. To implement it with your JavaScript applications, you can use KafkaJS. In this talk, the attendees will learn how to use Kafka in the context of a JavaScript microservices architecture.', '', 'a515ae23-5e28-408b-ab95-72494a490afc');

-- --------------------------------------------------------

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_ATTRIBUTE`
--

CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_CONSENT`
--

CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_ENTITY`
--

CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER_ENTITY`
--

INSERT INTO `USER_ENTITY` (`ID`, `EMAIL`, `EMAIL_CONSTRAINT`, `EMAIL_VERIFIED`, `ENABLED`, `FEDERATION_LINK`, `FIRST_NAME`, `LAST_NAME`, `REALM_ID`, `USERNAME`, `CREATED_TIMESTAMP`, `SERVICE_ACCOUNT_CLIENT_LINK`, `NOT_BEFORE`) VALUES
('a515ae23-5e28-408b-ab95-72494a490afc', NULL, '3af6df9f-774b-40f8-ba29-188cd20f4dc4', b'1', b'1', NULL, NULL, NULL, 'myrealm', 'joellord', 1610400351981, NULL, 0),
('a8a84f5d-bf2f-4d79-9169-64d3720e9b07', NULL, '488e07e8-5936-45a1-baa3-8cd3d14dedaf', b'0', b'1', NULL, NULL, NULL, 'master', 'admin', 1610400319289, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_ROLE_MAPPING`
--

CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

INSERT INTO `USER_ROLE_MAPPING` (`ROLE_ID`, `USER_ID`) VALUES
('32511aeb-6816-4d95-9440-0c9ecf258194', 'a515ae23-5e28-408b-ab95-72494a490afc'),
('931003d6-4178-49ce-8dbd-a4414a82983d', 'a515ae23-5e28-408b-ab95-72494a490afc'),
('a218f51c-cb1a-43e7-b30f-530351bd0820', 'a515ae23-5e28-408b-ab95-72494a490afc'),
('d4f6f28f-e200-4ca1-862d-c13b51347f90', 'a515ae23-5e28-408b-ab95-72494a490afc'),
('f7cde267-aed9-46b3-aa11-6a01c3ef9ce7', 'a515ae23-5e28-408b-ab95-72494a490afc'),
('195d9b4a-8781-484b-860b-e1371a25c2c4', 'a8a84f5d-bf2f-4d79-9169-64d3720e9b07'),
('1b7483bd-5613-4d5b-95ad-5b6e72c4050b', 'a8a84f5d-bf2f-4d79-9169-64d3720e9b07'),
('93c88f1b-afa6-492f-9e29-4530e5a5337e', 'a8a84f5d-bf2f-4d79-9169-64d3720e9b07'),
('97d6871f-dee1-4ad2-b08f-f7c7b8b62f15', 'a8a84f5d-bf2f-4d79-9169-64d3720e9b07'),
('f173aec1-599d-40c2-a5a3-36d6e76be492', 'a8a84f5d-bf2f-4d79-9169-64d3720e9b07');

-- --------------------------------------------------------

--
-- Table structure for table `USER_SESSION`
--

CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_SESSION_NOTE`
--

CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `WEB_ORIGINS`
--

CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WEB_ORIGINS`
--

INSERT INTO `WEB_ORIGINS` (`CLIENT_ID`, `VALUE`) VALUES
('0c8f9907-55f3-4bc7-b8bc-12c8871ab3d0', '+'),
('3e90ef2d-fb8a-4544-8f75-390af599c0ac', 'http://localhost:3000'),
('e05b255a-e287-427b-8837-13b3380af674', '+');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMIN_EVENT_ENTITY`
--
ALTER TABLE `ADMIN_EVENT_ENTITY`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ASSOCIATED_POLICY`
--
ALTER TABLE `ASSOCIATED_POLICY`
  ADD PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  ADD KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`);

--
-- Indexes for table `AUTHENTICATION_EXECUTION`
--
ALTER TABLE `AUTHENTICATION_EXECUTION`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  ADD KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`);

--
-- Indexes for table `AUTHENTICATION_FLOW`
--
ALTER TABLE `AUTHENTICATION_FLOW`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`);

--
-- Indexes for table `AUTHENTICATOR_CONFIG`
--
ALTER TABLE `AUTHENTICATOR_CONFIG`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`);

--
-- Indexes for table `AUTHENTICATOR_CONFIG_ENTRY`
--
ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY`
  ADD PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`);

--
-- Indexes for table `BROKER_LINK`
--
ALTER TABLE `BROKER_LINK`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`);

--
-- Indexes for table `cfp`
--
ALTER TABLE `cfp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfp_ignored`
--
ALTER TABLE `cfp_ignored`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfp_submissions`
--
ALTER TABLE `cfp_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  ADD KEY `IDX_CLIENT_ID` (`CLIENT_ID`);

--
-- Indexes for table `CLIENT_ATTRIBUTES`
--
ALTER TABLE `CLIENT_ATTRIBUTES`
  ADD PRIMARY KEY (`CLIENT_ID`,`NAME`);

--
-- Indexes for table `CLIENT_AUTH_FLOW_BINDINGS`
--
ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS`
  ADD PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`);

--
-- Indexes for table `CLIENT_DEFAULT_ROLES`
--
ALTER TABLE `CLIENT_DEFAULT_ROLES`
  ADD PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  ADD UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  ADD KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`);

--
-- Indexes for table `CLIENT_INITIAL_ACCESS`
--
ALTER TABLE `CLIENT_INITIAL_ACCESS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`);

--
-- Indexes for table `CLIENT_NODE_REGISTRATIONS`
--
ALTER TABLE `CLIENT_NODE_REGISTRATIONS`
  ADD PRIMARY KEY (`CLIENT_ID`,`NAME`);

--
-- Indexes for table `CLIENT_SCOPE`
--
ALTER TABLE `CLIENT_SCOPE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  ADD KEY `IDX_REALM_CLSCOPE` (`REALM_ID`);

--
-- Indexes for table `CLIENT_SCOPE_ATTRIBUTES`
--
ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES`
  ADD PRIMARY KEY (`SCOPE_ID`,`NAME`),
  ADD KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`);

--
-- Indexes for table `CLIENT_SCOPE_CLIENT`
--
ALTER TABLE `CLIENT_SCOPE_CLIENT`
  ADD PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  ADD KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  ADD KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`);

--
-- Indexes for table `CLIENT_SCOPE_ROLE_MAPPING`
--
ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING`
  ADD PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  ADD KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  ADD KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`);

--
-- Indexes for table `CLIENT_SESSION`
--
ALTER TABLE `CLIENT_SESSION`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`);

--
-- Indexes for table `CLIENT_SESSION_AUTH_STATUS`
--
ALTER TABLE `CLIENT_SESSION_AUTH_STATUS`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`);

--
-- Indexes for table `CLIENT_SESSION_NOTE`
--
ALTER TABLE `CLIENT_SESSION_NOTE`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`NAME`);

--
-- Indexes for table `CLIENT_SESSION_PROT_MAPPER`
--
ALTER TABLE `CLIENT_SESSION_PROT_MAPPER`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`);

--
-- Indexes for table `CLIENT_SESSION_ROLE`
--
ALTER TABLE `CLIENT_SESSION_ROLE`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`);

--
-- Indexes for table `CLIENT_USER_SESSION_NOTE`
--
ALTER TABLE `CLIENT_USER_SESSION_NOTE`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`NAME`);

--
-- Indexes for table `COMPONENT`
--
ALTER TABLE `COMPONENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  ADD KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`);

--
-- Indexes for table `COMPONENT_CONFIG`
--
ALTER TABLE `COMPONENT_CONFIG`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`);

--
-- Indexes for table `COMPOSITE_ROLE`
--
ALTER TABLE `COMPOSITE_ROLE`
  ADD PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  ADD KEY `IDX_COMPOSITE` (`COMPOSITE`),
  ADD KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`);

--
-- Indexes for table `CREDENTIAL`
--
ALTER TABLE `CREDENTIAL`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USER_CREDENTIAL` (`USER_ID`);

--
-- Indexes for table `DATABASECHANGELOGLOCK`
--
ALTER TABLE `DATABASECHANGELOGLOCK`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `DEFAULT_CLIENT_SCOPE`
--
ALTER TABLE `DEFAULT_CLIENT_SCOPE`
  ADD PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  ADD KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  ADD KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`);

--
-- Indexes for table `EVENT_ENTITY`
--
ALTER TABLE `EVENT_ENTITY`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`);

--
-- Indexes for table `FEDERATED_IDENTITY`
--
ALTER TABLE `FEDERATED_IDENTITY`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  ADD KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  ADD KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`);

--
-- Indexes for table `FEDERATED_USER`
--
ALTER TABLE `FEDERATED_USER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `FED_USER_ATTRIBUTE`
--
ALTER TABLE `FED_USER_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`);

--
-- Indexes for table `FED_USER_CONSENT`
--
ALTER TABLE `FED_USER_CONSENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  ADD KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  ADD KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`);

--
-- Indexes for table `FED_USER_CONSENT_CL_SCOPE`
--
ALTER TABLE `FED_USER_CONSENT_CL_SCOPE`
  ADD PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`);

--
-- Indexes for table `FED_USER_CREDENTIAL`
--
ALTER TABLE `FED_USER_CREDENTIAL`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  ADD KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`);

--
-- Indexes for table `FED_USER_GROUP_MEMBERSHIP`
--
ALTER TABLE `FED_USER_GROUP_MEMBERSHIP`
  ADD PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  ADD KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  ADD KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`);

--
-- Indexes for table `FED_USER_REQUIRED_ACTION`
--
ALTER TABLE `FED_USER_REQUIRED_ACTION`
  ADD PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  ADD KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  ADD KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`);

--
-- Indexes for table `FED_USER_ROLE_MAPPING`
--
ALTER TABLE `FED_USER_ROLE_MAPPING`
  ADD PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  ADD KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  ADD KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`);

--
-- Indexes for table `GROUP_ATTRIBUTE`
--
ALTER TABLE `GROUP_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`);

--
-- Indexes for table `GROUP_ROLE_MAPPING`
--
ALTER TABLE `GROUP_ROLE_MAPPING`
  ADD PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  ADD KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`);

--
-- Indexes for table `IDENTITY_PROVIDER`
--
ALTER TABLE `IDENTITY_PROVIDER`
  ADD PRIMARY KEY (`INTERNAL_ID`),
  ADD UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  ADD KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`);

--
-- Indexes for table `IDENTITY_PROVIDER_CONFIG`
--
ALTER TABLE `IDENTITY_PROVIDER_CONFIG`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`);

--
-- Indexes for table `IDENTITY_PROVIDER_MAPPER`
--
ALTER TABLE `IDENTITY_PROVIDER_MAPPER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`);

--
-- Indexes for table `IDP_MAPPER_CONFIG`
--
ALTER TABLE `IDP_MAPPER_CONFIG`
  ADD PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`);

--
-- Indexes for table `KEYCLOAK_GROUP`
--
ALTER TABLE `KEYCLOAK_GROUP`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`);

--
-- Indexes for table `KEYCLOAK_ROLE`
--
ALTER TABLE `KEYCLOAK_ROLE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  ADD KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  ADD KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`);

--
-- Indexes for table `MIGRATION_MODEL`
--
ALTER TABLE `MIGRATION_MODEL`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`);

--
-- Indexes for table `OFFLINE_CLIENT_SESSION`
--
ALTER TABLE `OFFLINE_CLIENT_SESSION`
  ADD PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  ADD KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`);

--
-- Indexes for table `OFFLINE_USER_SESSION`
--
ALTER TABLE `OFFLINE_USER_SESSION`
  ADD PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  ADD KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`);

--
-- Indexes for table `POLICY_CONFIG`
--
ALTER TABLE `POLICY_CONFIG`
  ADD PRIMARY KEY (`POLICY_ID`,`NAME`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PROTOCOL_MAPPER`
--
ALTER TABLE `PROTOCOL_MAPPER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  ADD KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`);

--
-- Indexes for table `PROTOCOL_MAPPER_CONFIG`
--
ALTER TABLE `PROTOCOL_MAPPER_CONFIG`
  ADD PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`);

--
-- Indexes for table `REALM`
--
ALTER TABLE `REALM`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  ADD KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`);

--
-- Indexes for table `REALM_ATTRIBUTE`
--
ALTER TABLE `REALM_ATTRIBUTE`
  ADD PRIMARY KEY (`NAME`,`REALM_ID`),
  ADD KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_DEFAULT_GROUPS`
--
ALTER TABLE `REALM_DEFAULT_GROUPS`
  ADD PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  ADD UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  ADD KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_DEFAULT_ROLES`
--
ALTER TABLE `REALM_DEFAULT_ROLES`
  ADD PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  ADD UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  ADD KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_ENABLED_EVENT_TYPES`
--
ALTER TABLE `REALM_ENABLED_EVENT_TYPES`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_EVENTS_LISTENERS`
--
ALTER TABLE `REALM_EVENTS_LISTENERS`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_LOCALIZATIONS`
--
ALTER TABLE `REALM_LOCALIZATIONS`
  ADD PRIMARY KEY (`REALM_ID`,`LOCALE`);

--
-- Indexes for table `REALM_REQUIRED_CREDENTIAL`
--
ALTER TABLE `REALM_REQUIRED_CREDENTIAL`
  ADD PRIMARY KEY (`REALM_ID`,`TYPE`);

--
-- Indexes for table `REALM_SMTP_CONFIG`
--
ALTER TABLE `REALM_SMTP_CONFIG`
  ADD PRIMARY KEY (`REALM_ID`,`NAME`);

--
-- Indexes for table `REALM_SUPPORTED_LOCALES`
--
ALTER TABLE `REALM_SUPPORTED_LOCALES`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`);

--
-- Indexes for table `REDIRECT_URIS`
--
ALTER TABLE `REDIRECT_URIS`
  ADD PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  ADD KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`);

--
-- Indexes for table `REQUIRED_ACTION_CONFIG`
--
ALTER TABLE `REQUIRED_ACTION_CONFIG`
  ADD PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`);

--
-- Indexes for table `REQUIRED_ACTION_PROVIDER`
--
ALTER TABLE `REQUIRED_ACTION_PROVIDER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`);

--
-- Indexes for table `RESOURCE_ATTRIBUTE`
--
ALTER TABLE `RESOURCE_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`);

--
-- Indexes for table `RESOURCE_POLICY`
--
ALTER TABLE `RESOURCE_POLICY`
  ADD PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  ADD KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`);

--
-- Indexes for table `RESOURCE_SCOPE`
--
ALTER TABLE `RESOURCE_SCOPE`
  ADD PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  ADD KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`);

--
-- Indexes for table `RESOURCE_SERVER`
--
ALTER TABLE `RESOURCE_SERVER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RESOURCE_SERVER_PERM_TICKET`
--
ALTER TABLE `RESOURCE_SERVER_PERM_TICKET`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  ADD KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`);

--
-- Indexes for table `RESOURCE_SERVER_POLICY`
--
ALTER TABLE `RESOURCE_SERVER_POLICY`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`);

--
-- Indexes for table `RESOURCE_SERVER_RESOURCE`
--
ALTER TABLE `RESOURCE_SERVER_RESOURCE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`);

--
-- Indexes for table `RESOURCE_SERVER_SCOPE`
--
ALTER TABLE `RESOURCE_SERVER_SCOPE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`);

--
-- Indexes for table `RESOURCE_URIS`
--
ALTER TABLE `RESOURCE_URIS`
  ADD PRIMARY KEY (`RESOURCE_ID`,`VALUE`);

--
-- Indexes for table `ROLE_ATTRIBUTE`
--
ALTER TABLE `ROLE_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`);

--
-- Indexes for table `SCOPE_MAPPING`
--
ALTER TABLE `SCOPE_MAPPING`
  ADD PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  ADD KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`);

--
-- Indexes for table `SCOPE_POLICY`
--
ALTER TABLE `SCOPE_POLICY`
  ADD PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  ADD KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`);

--
-- Indexes for table `talk`
--
ALTER TABLE `talk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `USERNAME_LOGIN_FAILURE`
--
ALTER TABLE `USERNAME_LOGIN_FAILURE`
  ADD PRIMARY KEY (`REALM_ID`,`USERNAME`);

--
-- Indexes for table `USER_ATTRIBUTE`
--
ALTER TABLE `USER_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USER_ATTRIBUTE` (`USER_ID`);

--
-- Indexes for table `USER_CONSENT`
--
ALTER TABLE `USER_CONSENT`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  ADD KEY `IDX_USER_CONSENT` (`USER_ID`);

--
-- Indexes for table `USER_CONSENT_CLIENT_SCOPE`
--
ALTER TABLE `USER_CONSENT_CLIENT_SCOPE`
  ADD PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  ADD KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`);

--
-- Indexes for table `USER_ENTITY`
--
ALTER TABLE `USER_ENTITY`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  ADD UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  ADD KEY `IDX_USER_EMAIL` (`EMAIL`);

--
-- Indexes for table `USER_FEDERATION_CONFIG`
--
ALTER TABLE `USER_FEDERATION_CONFIG`
  ADD PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`);

--
-- Indexes for table `USER_FEDERATION_MAPPER`
--
ALTER TABLE `USER_FEDERATION_MAPPER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  ADD KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`);

--
-- Indexes for table `USER_FEDERATION_MAPPER_CONFIG`
--
ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG`
  ADD PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`);

--
-- Indexes for table `USER_FEDERATION_PROVIDER`
--
ALTER TABLE `USER_FEDERATION_PROVIDER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`);

--
-- Indexes for table `USER_GROUP_MEMBERSHIP`
--
ALTER TABLE `USER_GROUP_MEMBERSHIP`
  ADD PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  ADD KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`);

--
-- Indexes for table `USER_REQUIRED_ACTION`
--
ALTER TABLE `USER_REQUIRED_ACTION`
  ADD PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  ADD KEY `IDX_USER_REQACTIONS` (`USER_ID`);

--
-- Indexes for table `USER_ROLE_MAPPING`
--
ALTER TABLE `USER_ROLE_MAPPING`
  ADD PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  ADD KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`);

--
-- Indexes for table `USER_SESSION`
--
ALTER TABLE `USER_SESSION`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `USER_SESSION_NOTE`
--
ALTER TABLE `USER_SESSION_NOTE`
  ADD PRIMARY KEY (`USER_SESSION`,`NAME`);

--
-- Indexes for table `WEB_ORIGINS`
--
ALTER TABLE `WEB_ORIGINS`
  ADD PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  ADD KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cfp`
--
ALTER TABLE `cfp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `cfp_ignored`
--
ALTER TABLE `cfp_ignored`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cfp_submissions`
--
ALTER TABLE `cfp_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `talk`
--
ALTER TABLE `talk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ASSOCIATED_POLICY`
--
ALTER TABLE `ASSOCIATED_POLICY`
  ADD CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  ADD CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`);

--
-- Constraints for table `AUTHENTICATION_EXECUTION`
--
ALTER TABLE `AUTHENTICATION_EXECUTION`
  ADD CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  ADD CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `AUTHENTICATION_FLOW`
--
ALTER TABLE `AUTHENTICATION_FLOW`
  ADD CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `AUTHENTICATOR_CONFIG`
--
ALTER TABLE `AUTHENTICATOR_CONFIG`
  ADD CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `CLIENT_ATTRIBUTES`
--
ALTER TABLE `CLIENT_ATTRIBUTES`
  ADD CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `CLIENT_DEFAULT_ROLES`
--
ALTER TABLE `CLIENT_DEFAULT_ROLES`
  ADD CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `CLIENT_INITIAL_ACCESS`
--
ALTER TABLE `CLIENT_INITIAL_ACCESS`
  ADD CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `CLIENT_NODE_REGISTRATIONS`
--
ALTER TABLE `CLIENT_NODE_REGISTRATIONS`
  ADD CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `CLIENT_SCOPE`
--
ALTER TABLE `CLIENT_SCOPE`
  ADD CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `CLIENT_SCOPE_ATTRIBUTES`
--
ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES`
  ADD CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`);

--
-- Constraints for table `CLIENT_SCOPE_CLIENT`
--
ALTER TABLE `CLIENT_SCOPE_CLIENT`
  ADD CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  ADD CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`);

--
-- Constraints for table `CLIENT_SCOPE_ROLE_MAPPING`
--
ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING`
  ADD CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`);

--
-- Constraints for table `CLIENT_SESSION`
--
ALTER TABLE `CLIENT_SESSION`
  ADD CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_SESSION_AUTH_STATUS`
--
ALTER TABLE `CLIENT_SESSION_AUTH_STATUS`
  ADD CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_SESSION_NOTE`
--
ALTER TABLE `CLIENT_SESSION_NOTE`
  ADD CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_SESSION_PROT_MAPPER`
--
ALTER TABLE `CLIENT_SESSION_PROT_MAPPER`
  ADD CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_SESSION_ROLE`
--
ALTER TABLE `CLIENT_SESSION_ROLE`
  ADD CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_USER_SESSION_NOTE`
--
ALTER TABLE `CLIENT_USER_SESSION_NOTE`
  ADD CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `COMPONENT`
--
ALTER TABLE `COMPONENT`
  ADD CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `COMPONENT_CONFIG`
--
ALTER TABLE `COMPONENT_CONFIG`
  ADD CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`);

--
-- Constraints for table `COMPOSITE_ROLE`
--
ALTER TABLE `COMPOSITE_ROLE`
  ADD CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  ADD CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`);

--
-- Constraints for table `CREDENTIAL`
--
ALTER TABLE `CREDENTIAL`
  ADD CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `DEFAULT_CLIENT_SCOPE`
--
ALTER TABLE `DEFAULT_CLIENT_SCOPE`
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`);

--
-- Constraints for table `FEDERATED_IDENTITY`
--
ALTER TABLE `FEDERATED_IDENTITY`
  ADD CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `GROUP_ATTRIBUTE`
--
ALTER TABLE `GROUP_ATTRIBUTE`
  ADD CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`);

--
-- Constraints for table `GROUP_ROLE_MAPPING`
--
ALTER TABLE `GROUP_ROLE_MAPPING`
  ADD CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`);

--
-- Constraints for table `IDENTITY_PROVIDER`
--
ALTER TABLE `IDENTITY_PROVIDER`
  ADD CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `IDENTITY_PROVIDER_CONFIG`
--
ALTER TABLE `IDENTITY_PROVIDER_CONFIG`
  ADD CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`);

--
-- Constraints for table `IDENTITY_PROVIDER_MAPPER`
--
ALTER TABLE `IDENTITY_PROVIDER_MAPPER`
  ADD CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `IDP_MAPPER_CONFIG`
--
ALTER TABLE `IDP_MAPPER_CONFIG`
  ADD CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`);

--
-- Constraints for table `KEYCLOAK_GROUP`
--
ALTER TABLE `KEYCLOAK_GROUP`
  ADD CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `KEYCLOAK_ROLE`
--
ALTER TABLE `KEYCLOAK_ROLE`
  ADD CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `POLICY_CONFIG`
--
ALTER TABLE `POLICY_CONFIG`
  ADD CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`);

--
-- Constraints for table `PROTOCOL_MAPPER`
--
ALTER TABLE `PROTOCOL_MAPPER`
  ADD CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  ADD CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `PROTOCOL_MAPPER_CONFIG`
--
ALTER TABLE `PROTOCOL_MAPPER_CONFIG`
  ADD CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`);

--
-- Constraints for table `REALM_ATTRIBUTE`
--
ALTER TABLE `REALM_ATTRIBUTE`
  ADD CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_DEFAULT_GROUPS`
--
ALTER TABLE `REALM_DEFAULT_GROUPS`
  ADD CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_DEFAULT_ROLES`
--
ALTER TABLE `REALM_DEFAULT_ROLES`
  ADD CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_ENABLED_EVENT_TYPES`
--
ALTER TABLE `REALM_ENABLED_EVENT_TYPES`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_EVENTS_LISTENERS`
--
ALTER TABLE `REALM_EVENTS_LISTENERS`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_REQUIRED_CREDENTIAL`
--
ALTER TABLE `REALM_REQUIRED_CREDENTIAL`
  ADD CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_SMTP_CONFIG`
--
ALTER TABLE `REALM_SMTP_CONFIG`
  ADD CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_SUPPORTED_LOCALES`
--
ALTER TABLE `REALM_SUPPORTED_LOCALES`
  ADD CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REDIRECT_URIS`
--
ALTER TABLE `REDIRECT_URIS`
  ADD CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `REQUIRED_ACTION_PROVIDER`
--
ALTER TABLE `REQUIRED_ACTION_PROVIDER`
  ADD CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `RESOURCE_ATTRIBUTE`
--
ALTER TABLE `RESOURCE_ATTRIBUTE`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`);

--
-- Constraints for table `RESOURCE_POLICY`
--
ALTER TABLE `RESOURCE_POLICY`
  ADD CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  ADD CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`);

--
-- Constraints for table `RESOURCE_SCOPE`
--
ALTER TABLE `RESOURCE_SCOPE`
  ADD CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  ADD CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`);

--
-- Constraints for table `RESOURCE_SERVER_PERM_TICKET`
--
ALTER TABLE `RESOURCE_SERVER_PERM_TICKET`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  ADD CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`);

--
-- Constraints for table `RESOURCE_SERVER_POLICY`
--
ALTER TABLE `RESOURCE_SERVER_POLICY`
  ADD CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`);

--
-- Constraints for table `RESOURCE_SERVER_RESOURCE`
--
ALTER TABLE `RESOURCE_SERVER_RESOURCE`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`);

--
-- Constraints for table `RESOURCE_SERVER_SCOPE`
--
ALTER TABLE `RESOURCE_SERVER_SCOPE`
  ADD CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`);

--
-- Constraints for table `RESOURCE_URIS`
--
ALTER TABLE `RESOURCE_URIS`
  ADD CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`);

--
-- Constraints for table `ROLE_ATTRIBUTE`
--
ALTER TABLE `ROLE_ATTRIBUTE`
  ADD CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`);

--
-- Constraints for table `SCOPE_MAPPING`
--
ALTER TABLE `SCOPE_MAPPING`
  ADD CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `SCOPE_POLICY`
--
ALTER TABLE `SCOPE_POLICY`
  ADD CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  ADD CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`);

--
-- Constraints for table `USER_ATTRIBUTE`
--
ALTER TABLE `USER_ATTRIBUTE`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_CONSENT`
--
ALTER TABLE `USER_CONSENT`
  ADD CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_CONSENT_CLIENT_SCOPE`
--
ALTER TABLE `USER_CONSENT_CLIENT_SCOPE`
  ADD CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`);

--
-- Constraints for table `USER_FEDERATION_CONFIG`
--
ALTER TABLE `USER_FEDERATION_CONFIG`
  ADD CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`);

--
-- Constraints for table `USER_FEDERATION_MAPPER`
--
ALTER TABLE `USER_FEDERATION_MAPPER`
  ADD CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  ADD CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `USER_FEDERATION_MAPPER_CONFIG`
--
ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG`
  ADD CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`);

--
-- Constraints for table `USER_FEDERATION_PROVIDER`
--
ALTER TABLE `USER_FEDERATION_PROVIDER`
  ADD CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `USER_GROUP_MEMBERSHIP`
--
ALTER TABLE `USER_GROUP_MEMBERSHIP`
  ADD CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_REQUIRED_ACTION`
--
ALTER TABLE `USER_REQUIRED_ACTION`
  ADD CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_ROLE_MAPPING`
--
ALTER TABLE `USER_ROLE_MAPPING`
  ADD CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_SESSION_NOTE`
--
ALTER TABLE `USER_SESSION_NOTE`
  ADD CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`);

--
-- Constraints for table `WEB_ORIGINS`
--
ALTER TABLE `WEB_ORIGINS`
  ADD CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
