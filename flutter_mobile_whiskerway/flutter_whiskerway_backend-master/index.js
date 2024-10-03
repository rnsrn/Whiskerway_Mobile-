// Import required modules
const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const bodyParser = require('body-parser');
const cors = require('cors');
const bcrypt = require('bcrypt');

// Load environment variables from .env file
dotenv.config();

// Initialize Express app
const app = express();
app.use(cors());
app.use(bodyParser.json());

// Connect to MongoDB using connection string from .env file
mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => console.log('MongoDB connected to whiskerwaydb'))
  .catch(err => console.log(err));

// Define User schema and model with timestamps
const UserSchema = new mongoose.Schema({
    firstname: String,
    lastname: String,
    mobile: String,
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    role: { type: String, default: 'user' },
    pets: { type: Array, default: [] },
}, { timestamps: true }); // Automatically adds `createdAt` and `updatedAt` fields

const User = mongoose.model('User', UserSchema);

// Define Pet schema and model
const PetSchema = new mongoose.Schema({
    name: String,
    type: String,
    age: Number,
    owner: String,
});

const Pet = mongoose.model('Pet', PetSchema);

// Define UserMobile schema and model, specifying the collection name explicitly
const UserMobileSchema = new mongoose.Schema({
    mobileNumber: String,
    userId: mongoose.Schema.Types.ObjectId,
});

// Specify 'users_mobile' as the collection name to avoid creating 'usersmobiles'
const UserMobile = mongoose.model('UserMobile', UserMobileSchema, 'users_mobile');

// Root route
app.get('/', (req, res) => {
    res.send('Welcome to the Backend API!');
});

// Register route
app.post('/register', async (req, res) => {
    const { firstname, lastname, mobile, email, password } = req.body;

    try {
        // Hash the password before saving
        const hashedPassword = await bcrypt.hash(password, 10);

        const newUser = new User({
            firstname,
            lastname,
            mobile,
            email,
            password: hashedPassword,
            role: 'user', // Default role
            pets: [], // Initialize with an empty array for pets
        });

        await newUser.save();
        res.status(201).send('User registered');
    } catch (err) {
        res.status(500).send(err.message);
    }
});

// Login route
app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    try {
        // Find the user by email
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).send('User not found');
        }

        // Compare the provided password with the hashed password in the database
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).send('Invalid credentials');
        }

        // Respond with a success message or user data
        res.status(200).send('Login successful');
    } catch (err) {
        res.status(500).send(err.message);
    }
});

// Example route to add a pet
app.post('/pets', async (req, res) => {
    const { name, type, age, owner } = req.body;
    const newPet = new Pet({ name, type, age, owner });
    try {
        await newPet.save();
        res.status(201).send('Pet added');
    } catch (err) {
        res.status(500).send(err.message);
    }
});

// Example route to add user mobile info
app.post('/users_mobile', async (req, res) => {
    const { mobileNumber, userId } = req.body;
    const newUserMobile = new UserMobile({ mobileNumber, userId });
    try {
        await newUserMobile.save();
        res.status(201).send('User mobile info added');
    } catch (err) {
        res.status(500).send(err.message);
    }
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));