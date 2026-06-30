import app from "./app/app.js";
import dotenv from "dotenv";
import { modelApp } from "./config/models.app.js";
import db from "./config/connect.db.js";
import { categoryModel } from './models/category.model.js';
import { productModel } from './models/product.model.js';
import categoryRouter from './routers/category.router.js';
import productRouter from './routers/product.router.js';

dotenv.config({ path: './.env' }); 

const port = process.env.SERVER_PORT || 3001;


modelApp(false); 

app.use('/api/v1/category', categoryRouter);
app.use('/api/v1/product', productRouter);

db.sync({ force: false })
    .then(() => {
        console.log('--- TABLAS CREADAS CORRECTAMENTE ---');
      
        app.listen(port, () => {
            console.log(`Connected Server .... ${port}`);
        });
    })
    .catch(err => console.log('Error al sincronizar:', err));