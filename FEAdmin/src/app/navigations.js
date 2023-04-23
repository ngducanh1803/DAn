import ConstantList from './appConfig';
export const navigations = [
    // {
    //     name: 'Dashboard.dashboard',
    //     icon: 'dashboard',
    //     path: ConstantList.ROOT_PATH + 'dashboard/analytics',
    //     isVisible: true,
    // },
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
        ],
    },
];
