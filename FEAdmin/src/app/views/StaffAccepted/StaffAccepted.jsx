import React, { Component, useState, useEffect } from "react";
import {
    DeleteFilled,
    EditFilled,
    EyeFilled,
    HomeFilled,
} from '@ant-design/icons';
import { Breadcrumb, Button, Form, Modal, Table, Tooltip } from 'antd';
import Styled from '../create-staff/CreateStaffStyled';
import SearchStaff from '../create-staff/Search';
import { toast } from 'react-toastify';
import moment from "moment";
import { getTourChiTiet, deleteTourChiTiet } from "./StaffAcceptedService";
import StaffAcceptedDialog from "./StaffAcceptedDialog";

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

function StaffAccepted() {

    const [searchInfo, setSearchInfo] = useState("")
    const [dataTourChiTiet, setDataTourChiTiet] = useState([])
    const [dataTourSearch, setDataTourSearch] = useState([])
    const [openDialogAdd, setOpenDialogAdd] = useState(false)
    const [openDialogDelete, setOpenDialogDelete] = useState(false)
    const [tourDelete, setTourDelete] = useState()
    const [tourEdit, setTourEdit] = useState()
    const [dem, setDem] = useState(0)

    const [cellVisible, setCellVisible] = useState({});
    const handleCellClick = (key) => {
        setCellVisible({
            ...cellVisible,
            [key]: !cellVisible[key]
        });
    };

    const getTourFromBackEnd = async () => {
        const res = await getTourChiTiet()

        const data = res.data
        const newData = data.map((item, index) => {
            return {
                ...item,
                key: index.toString()
            }
        })
        setDataTourChiTiet(newData)
        // setDataTour(res.data)
    }

    const onSearch = () => {
        const result = dataTourChiTiet.filter(
            (item) =>
                item.idChiTiet.toString().includes(searchInfo) ||
                item.ngayDi.toString().includes(searchInfo) ||
                item.ngayDi.toString().includes(searchInfo) ||
                item.ghiChu.toString().includes(searchInfo)
        );
        setDataTourSearch(result)
        setDem(1)
    }

    const returnTour = () => {
        if (dataTourSearch.length === 0 && dem === 0) {
            return dataTourChiTiet
        } else if (dataTourSearch.length === 0 && dem === 1) {
            return dataTourSearch
        }
        else {
            return dataTourSearch
        }
    }


    // =========== Xoa =============

    const onClickIconDelete = (rowData) => {
        setOpenDialogDelete(true)
        setTourDelete(rowData)
    }

    const onCancelDelete = () => {
        setOpenDialogDelete(false)
        setTourDelete()
        setTourEdit()
        setCellVisible({})
    }

    const onOkDelete = async () => {
        const res = await deleteTourChiTiet(tourDelete.idChiTiet)
        if (res.status === 200) {
            toast.success("Xoa tour thanh cong")
        } else {
            toast.error("Loi !!!")
        }
        onCancelDelete()
        await getTourFromBackEnd()
    }

    // =============================

    // ========== Them =============
    const handleClickAdd = () => {
        setTourEdit()
        setOpenDialogAdd(true)
    }

    const cancelDialogAdd = async () => {
        setOpenDialogAdd(false)
        setCellVisible({})
        // setTourEdit()
        getTourFromBackEnd()
    }

    // ============================

    // ========= Sua ==============

    const onClickIconEdit = (rowData) => {
        setTourEdit(rowData)
        setOpenDialogAdd(true)
    }

    // ============================


    useEffect(() => {
        getTourFromBackEnd()
    }, [])

    return (
        <Styled>
            <div className="m-sm-30">
                <Breadcrumb style={{ padding: '0 0 30px 0' }}>
                    <Breadcrumb.Item href="/">
                        <HomeFilled />
                    </Breadcrumb.Item>
                    <Breadcrumb.Item href="/conclude/manage">
                        <span>Quản lý nhân viên</span>
                    </Breadcrumb.Item>
                    <Breadcrumb.Item>Tạo mới</Breadcrumb.Item>
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
                    <StaffAcceptedDialog
                        item={tourEdit}
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
                        { title: 'Id', dataIndex: 'idChiTiet', width: 50 },
                        {
                            title: 'Ngay di',
                            width: 100,
                            render: rowData => moment(rowData.ngayDi, "YYYY-MM-DD").format("DD-MM-YYYY")
                        },
                        {
                            title: 'Ngay ve',
                            width: 100,
                            render: rowData => moment(rowData.ngayVe, "YYYY-MM-DD").format("DD-MM-YYYY")

                        },
                        {
                            title: 'So luong con',
                            width: 120,
                            dataIndex: 'soLuongCon'
                        },
                        {
                            title: 'Ghi chu',
                            dataIndex: "ghiChu",
                            // render: record => record.ghiChu.substring(0, 30) + "..."
                            render: (text, record) => {
                                return (
                                    <div onClick={() => handleCellClick(record.key)}>
                                        {cellVisible[record.key] ? text : record.ghiChu.substring(0, 30) + "..."}
                                    </div>
                                );
                            }
                        },
                        {
                            title: 'HInh anh',
                            // dataIndex: "hinhAnh"
                            render: rowData => rowData.hinhAnh.substring(0, 30) + "..."
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

export default StaffAccepted

/**
 * {
        "idChiTiet": 1,
        "ngayDi": "2023-06-06T04:06:00.000+00:00",
        "ngayVe": "2019-06-10T17:03:00.000+00:00",
        "soLuongCon": 23,
        "ghiChu": "Du lịch Miền Trung - Tour Du lịch Đà Nẵng được thiên nhiên đặc biệt ưu đãi, mảnh đất miền Trung đẹp với nhiều dãy núi hùng vỹ xanh rì, những bờ biển cát trắng mịn thoai thoải và những dòng sông trong vắt thơ mộng. Không những vậy, trên con đường di sản miền Trung cùng du lịch thanh tùng, du khách còn được thưởng ngoạn những di sản thế giới cuả Việt Nam đó là Phố cổ Hội An – nơi bến cảng một thời sầm uất nhất Đông Dương, quần thể di tích Cố Đô Huế với hệ thống đền đài lăng tẩm nguy nga tráng lệ và Động Phong Nha với nhiều hang động kì bí của tạo hóa..",
        "hinhAnh": "YbhTzyNe2EuyMf3uPtC3JGdyR48ApRNX9l9hH5Qk.jpeg"
    },
 */