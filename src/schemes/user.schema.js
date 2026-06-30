import Joi from "@hapi/joi";
import { updateUser } from "../controller/user.controller.js";

export default{
    createUser: Joi.object({
        user_user: Joi.string().required().min(10),
        user_password: Joi.string().required().min(7),
        userStatus_fk: Joi.number().required(),
        role_fk: Joi.number().required(),
    }),
    updateUser: Joi.object({
        user_user: Joi.string().required().min(10),
        user_password: Joi.string().required().min(7),
        userStatus_fk: Joi.number().required(),
        role_fk: Joi.number(),
    }),
}