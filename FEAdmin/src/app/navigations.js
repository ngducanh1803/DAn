import ConstantList from './appConfig';
export const navigations = [
    {
        name: 'Quan ly du lich',
        icon: 'engineering',
        path: '',
        isVisible: true,
        children: [
            {
                name: 'Danh sach tour',
                isVisible: true,
                path: ConstantList.ROOT_PATH + 'list/createStaff',
                icon: 'groupAdd',
            },
            {
                name: 'Phieu dat',
                isVisible: true,
                path: ConstantList.ROOT_PATH + 'pending_manager/pending',
                icon: 'folderShared',
            },
            {
                name: 'Chi tiet tour',
                path: ConstantList.ROOT_PATH + 'staffAccepted_manager/staffAccepted',
                icon: 'taskAlt',
                isVisible: true,
            },
            {
                name: 'Tin Tuc',
                path: ConstantList.ROOT_PATH + 'tintuc_manager/tintuc',
                icon: 'taskAlt',
                isVisible: true,
            },
            {
                name: 'Khach San',
                path: ConstantList.ROOT_PATH + 'khachsan_manager/khachsan',
                icon: 'taskAlt',
                isVisible: true,
            },
            {
                name: 'Khach Dat',
                path: ConstantList.ROOT_PATH + 'khachdat_manager/khachdat',
                icon: 'taskAlt',
                isVisible: true,
            },
        ],
    },
];
