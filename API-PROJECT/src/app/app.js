import express from "express";
import userRouter from "../routers/user.router.js";
import morgan from "morgan";
import UserStatusRouter from "../routers/userStatus.router.js";
import roleRouter from "../routers/role.router.js";
import UserStatus from "../models/userStatus.model.js";
import categoryRouter from "../routers/category.router.js";
import cors from 'cors'; 
import productRouter from "../routers/product.router.js";   

const app = express();
app.use(cors());
app.use(morgan("dev"));
app.use(express.json());

app.use("/api/v1", userRouter);
app.use("/api/v1", roleRouter);
app.use("/api/v1", UserStatusRouter);

// 👇 Agregados AQUÍ antes del bloque 404
app.use("/api/v1/category", categoryRouter);
app.use("/api/v1/product", productRouter);

app.use((req, res, next) => {
    res.status(404).json({
        message: "Endpoint losses"
    });
});

export default app;