import React, { useEffect, useState } from "react";
import {
    DeleteFilled,
    EditFilled,
    HomeFilled,
} from '@ant-design/icons';
import { Breadcrumb, Button, Modal, Table, Tooltip } from 'antd';
import Styled from '../create-staff/CreateStaffStyled';
import { getPhieuDat, deletePhieu, updateTrangThaiPhieuDat } from "./PendingService";
import SearchStaff from '../create-staff/Search';
import { toast } from 'react-toastify';
import moment from "moment";
import PendingDialog from "./PendingDialog";
import ChiTietDialog from "./ChiTietDialog";
import DuyetDialog from "./DuyetDialog";
import { update } from "lodash";

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 1000
});

const DialogDelete = (props) => {

    const { open, onOk, onCancel } = props

    return (
        <Modal
            title="Xoa tour"
            open={open}
            onOk={onOk}
            onCancel={onCancel}
        >
            <p>Ban co chac muon xoa ?</p>
        </Modal>
    )
}

function Pending() {

    const [searchInfo, setSearchInfo] = useState("")
    const [dataPhieu, setDataPhieu] = useState([])
    const [dataPhieuSearch, setDataPhieuSearch] = useState([])
    const [openDialogAdd, setOpenDialogAdd] = useState(false)
    const [openDialogDelete, setOpenDialogDelete] = useState(false)
    const [phieuDelete, setPhieuDelete] = useState()
    const [phieuEdit, setPhieuEdit] = useState()

    const [isModalOpen, setIsModalOpen] = useState(false)
    const [idChitiettour, setIdChiTietTour] = useState()

    const [isOpenDuyet, setIsOpenDuyet] = useState(false)
    const [idDuyet, setIdDuyet] = useState()

    const [dem, setDem] = useState(0)

    const getPhieuDatFromBackEnd = async () => {
        const res = await getPhieuDat()
        setDataPhieu(res.data)
    }

    const onSearch = () => {
        const result = dataPhieu.filter(
            (item) => {
                if (item?.ten.includes(searchInfo) || item?.diaChi.includes(searchInfo)) {
                    return true
                } else {
                    return false
                }
            }

        );
        setDataPhieuSearch(result)
        setDem(1)
    }

    const returnTour = () => {
        if (dataPhieuSearch.length === 0 && dem === 0) {
            return dataPhieu
        } else if (dataPhieuSearch.length === 0 && dem === 1) {
            return dataPhieuSearch
        }
        else {
            return dataPhieuSearch
        }
    }

    // =========== Xoa =============

    const onClickIconDelete = (rowData) => {
        setOpenDialogDelete(true)
        setPhieuDelete(rowData)
    }

    const onCancelDelete = () => {
        setOpenDialogDelete(false)
        setPhieuDelete()
    }

    const onOkDelete = async () => {
        const res = await deletePhieu(phieuDelete)
        if (res.status === 200) {
            toast.success("Xoa tour thanh cong")
        } else {
            toast.error("Loi !!!")
        }
        onCancelDelete()
        await getPhieuDatFromBackEnd()
    }

    // =============================

    // ========== Them =============
    const handleClickAdd = () => {
        setOpenDialogAdd(true)
    }

    const cancelDialogAdd = async () => {
        setOpenDialogAdd(false)
        setPhieuEdit()
        getPhieuDatFromBackEnd()
    }

    // ============================

    const onClickIconEdit = (rowData) => {
        setPhieuEdit(rowData)
        setOpenDialogAdd(true)
    }

    // ========= dialog cho tiet =======

    const handleClickId = (id) => {
        setIdChiTietTour(id)
        setIsModalOpen(true)
    }

    const cancelChiTietDialog = () => {
        setIsModalOpen(false)
        setIdChiTietTour()
    }

    // ========= duyet phieu ===========
    const handleClickDuyet = async (id) => {
        setIdDuyet(id)
        setIsOpenDuyet(true)
    }

    const cancelDialogDuyet = () => {
        setIsOpenDuyet(false)
        setIdDuyet()
    }

    const okDialogDuyet = async () => {
        const res = await updateTrangThaiPhieuDat(idDuyet)
        if (res.status === 200) {
            toast.success("duyet thanh cong")
        } else {
            toast.success("Loi !!!!")
        }
        cancelDialogDuyet()
        await getPhieuDatFromBackEnd()
    }


    useEffect(() => {
        getPhieuDatFromBackEnd()
    }, [])

    return (
        <Styled>
            <div className="m-sm-30">
                <Breadcrumb style={{ padding: '0 0 30px 0' }}>
                    <Breadcrumb.Item href="/">
                        <HomeFilled />
                    </Breadcrumb.Item>
                    <Breadcrumb.Item href="/conclude/manage">
                        <span>Quản lý tour</span>
                    </Breadcrumb.Item>
                    <Breadcrumb.Item>Phiếu đặt</Breadcrumb.Item>
                </Breadcrumb>

                <div className='set-space-between'>
                    <Button size="middle"
                        onClick={handleClickAdd}
                        className="btn-add-new"
                    >
                        TẠO MỚI
                    </Button>
                    <SearchStaff
                        searchInfo={searchInfo} setSearchInfo={setSearchInfo} onSearch={onSearch}
                    />
                </div>

                {
                    openDialogAdd &&
                    <PendingDialog
                        item={phieuEdit}
                        open={openDialogAdd}
                        onCancel={cancelDialogAdd}
                    />
                }

                {
                    openDialogDelete &&
                    <DialogDelete
                        open={openDialogDelete}
                        onOk={onOkDelete}
                        onCancel={onCancelDelete}
                    />
                }

                {
                    isModalOpen &&
                    <ChiTietDialog
                        isModalOpen={isModalOpen}
                        handleCancel={cancelChiTietDialog}
                        id={idChitiettour}
                    />
                }

                {
                    isOpenDuyet && <DuyetDialog
                        open={isOpenDuyet}
                        onCancel={cancelDialogDuyet}
                        idDuyet={idDuyet}
                        handleOk={okDialogDuyet}
                    />
                }


                <Table
                    dataSource={returnTour()}
                    columns={[
                        {
                            key: 'action',
                            title: 'Thao tác',
                            dataIndex: 'action',
                            align: 'center',
                            width: 100,
                            render: (text, rowData) => {
                                return (
                                    <div
                                        className='createStaff-action'
                                        style={{ gap: "16px 16px" }}
                                    >
                                        <Tooltip placement="bottom" title="chỉnh sửa">
                                            <EditFilled
                                                style={{ color: "blue" }}
                                                onClick={() => onClickIconEdit(rowData)}
                                            />
                                        </Tooltip>

                                        <Tooltip placement="bottom" title="xóa">
                                            <DeleteFilled
                                                style={{ color: "red" }}
                                                onClick={() => onClickIconDelete(rowData)}
                                            />
                                        </Tooltip>
                                    </div>
                                );
                            },
                        },
                        { title: 'Tên', dataIndex: 'ten' },
                        { title: 'Địa chỉ', dataIndex: 'diaChi' },
                        { title: 'SĐT', dataIndex: 'sdt' },
                        { title: 'Email', dataIndex: 'email' },
                        {
                            title: 'Ngày tạo',
                            render: (rowData) => moment(rowData.ngayDat, 'YYYY-MM-DD').format('DD-MM-YYYY')
                        },
                        {
                            title: 'Trẻ em',
                            dataIndex: "treEm",
                            width: 80
                        },
                        {
                            title: 'Trẻ nhỏ',
                            dataIndex: "treNho"
                        },
                        {
                            title: 'Người lớn',
                            dataIndex: "nguoiLon"
                        },
                        {
                            title: 'Ghi chú',
                            dataIndex: "ghiChu"
                        },
                        {
                            title: 'Tour đã đặt',
                            dataIndex: 'idChitiettour',
                            render: (text, record) => {
                                return (
                                    <div onClick={() => handleClickId(record.idChitiettour)}>
                                        <button className="btn blue">
                                            {record?.idChitiettour ? "Xem tour " + record.idChitiettour : " "}
                                        </button>
                                    </div>
                                );
                            }
                        },
                        {
                            title: "Trang thai",
                            dataIndex: "trangThai",
                            render: (text, record) => {
                                return (
                                    <div>{record.trangThai === 0 ? <button className="btn red" onClick={() => handleClickDuyet(record.id)}>Chua duyet</button> : "Da duyet"}</div>
                                )
                            }
                        }

                    ]}
                    pagination={{
                        showSizeChanger: true,
                        pageSizeOptions: ['5', '10', '20'],
                    }}
                    scroll={{ y: 440 }}
                />
            </div>
        </Styled>
    )
}

export default Pending

/**
             "ten": "duc anh 1",
            "diaChi": "bac ninh",
            "sdt": "971533818",
            "email": "ducanh@gmail.com",
    *      "createDate": "2023-04-13",
         "treEm": 3,
        "treNho": 3,
        "nguoiLon": 4,
        "ghiChu": "nay anynay",
        "chiTietTour": {
            "idChiTiet": 1,
        }
 */