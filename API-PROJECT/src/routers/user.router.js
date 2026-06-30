import { Router } from 'express';
// IMPORTANTE: Usa llaves {} porque en el controlador usas exportaciones individuales
import { 
    createUser, 
    loginUser, 
    showUser, 
    updateUser, 
    deleteUser 
} from '../controller/user.controller.js';

const userRouter = Router();

userRouter.post('/register', createUser);
userRouter.post('/login', loginUser);
userRouter.get('/', showUser);
userRouter.put('/:id', updateUser);
userRouter.delete('/:id', deleteUser);

export default userRouter;