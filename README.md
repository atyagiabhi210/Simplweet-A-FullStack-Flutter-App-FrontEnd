# Simplweet

Simplweet is a full-stack application built using Flutter, NodeJS, and MongoDB. It provides a simple platform for users to share short messages or "tweets" with others. This README file will guide you through the setup process and provide an overview of the application's features.

## Features

- User authentication: Users can sign up and log in securely to access the application.
- Create and share tweets: Users can compose short messages and share them with others.
- View and interact with tweets: Users can view tweets from other users and interact by liking or replying to them.
- Search functionality: Users can search for specific tweets or users within the application.
- Responsive design: The application is designed to work seamlessly across different devices and screen sizes.

## Technologies Used

- **Frontend:** Flutter
- **Backend:** NodeJS
- **Database:** MongoDB

## Setup Instructions

### Backend Setup

1. Clone the repository from GitHub: `git clone https://github.com/atyagiabhi210/Flutter_FS_Backend'
2. Navigate to the backend directory: `cd backend`
3. Install dependencies: `npm install`
4. Set up environment variables:
   - Create a `.env` file in the backend directory.
   - Add the following variables:
     ```
     PORT=3000
     MONGODB_URI=<your_mongodb_uri>
     JWT_SECRET=<your_jwt_secret>
     ```
5. Run the server: `npm start`

### Frontend Setup

1. Clone the repository from GitHub: `git clone https://github.com/atyagiabhi210/Simplweet-A-FullStack-Flutter-App-FrontEnd`
2. Navigate to the frontend directory: `cd frontend`
3. Install dependencies: `flutter pub get`
4. Run the application:
   - Connect your device/emulator.
   - Run `flutter run`.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvement, please feel free to open an issue or create a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or support, please contact Abhishek Tyagi (mailto:atyagiabhi210@gmail.com).
