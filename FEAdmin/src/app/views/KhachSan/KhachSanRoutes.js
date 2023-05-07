import { EgretLoadable } from "egret";
import ConstantList from "../../appConfig";
import { useTranslation, withTranslation, Trans } from 'react-i18next';
const KhachSan = EgretLoadable({
    loader: () => import("./KhachSan")
});
const ViewComponent = withTranslation()(KhachSan);

const KhachSanRoutes = [
    {
        path: ConstantList.ROOT_PATH + "khachsan_manager/khachsan",
        exact: true,
        component: ViewComponent
    }
];

export default KhachSanRoutes;