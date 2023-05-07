import { EgretLoadable } from "egret";
import ConstantList from "../../appConfig";
import { useTranslation, withTranslation, Trans } from 'react-i18next';
const KhachDat = EgretLoadable({
    loader: () => import("./KhachDat")
});
const ViewComponent = withTranslation()(KhachDat);

const KhachDatRoutes = [
    {
        path: ConstantList.ROOT_PATH + "khachdat_manager/khachdat",
        exact: true,
        component: ViewComponent
    }
];

export default KhachDatRoutes;