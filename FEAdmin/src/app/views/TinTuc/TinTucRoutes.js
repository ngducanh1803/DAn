import { EgretLoadable } from "egret";
import ConstantList from "../../appConfig";
import { useTranslation, withTranslation, Trans } from 'react-i18next';
const TinTuc = EgretLoadable({
    loader: () => import("./TinTuc")
});
const ViewComponent = withTranslation()(TinTuc);

const TinTucRoutes = [
    {
        path: ConstantList.ROOT_PATH + "tintuc_manager/tintuc",
        exact: true,
        component: ViewComponent
    }
];

export default TinTucRoutes;