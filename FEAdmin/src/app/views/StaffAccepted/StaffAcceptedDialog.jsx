import React, { useEffect, useState } from "react";
import { Modal, Button, Tabs, Row, Col, Table, Image, Form, Input } from "antd"

import styled from 'styled-components';
import moment from "moment";
import { addTourChiTiet, updateTourChiTiet } from "./StaffAcceptedService";
import { toast } from "react-toastify";

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 3,
    closeOnClick: true
});

function StaffAcceptedDialog(props) {

    const { open, onCancel, item } = props
    const [form] = Form.useForm()
    const [timeItem, setTimeItem] = useState()

    const submitForm = async (values) => {

        if (item) {
            const res = await updateTourChiTiet(item.idChiTiet, values)
            if (res.status === 200) {
                toast.success("Sua thanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        } else {
            const res = await addTourChiTiet(values)
            if (res.status === 200) {
                toast.success("Them hanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        }
        form.resetFields()
        onCancel()
    }

    useEffect(() => {
        console.log("==>", item)
        if (item) {
            const newItem = {
                ...item,
                ngayDi: moment(item.ngayDi, "YYYY-MM-DD").format("YYYY-MM-DD"),
                ngayVe: moment(item.ngayVe, "YYYY-MM-DD").format("YYYY-MM-DD")
            }
            if (newItem) {
                form.setFieldsValue(newItem)
            }
        }
    }, [])



    return (
        <Modal
            title="Them Tour"
            open={open}
            width={1000}
            style={{ height: 700 }}
            // onOk={handleOk} 
            onCancel={onCancel}
            footer={null}
        >
            <Form
                form={form}
                onFinish={submitForm}
                layout="vertical"
            >
                <Row gutter={[16, 16]}>
                    <Col span={6}>
                        <Form.Item
                            name="idTour"
                            label="Id"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "ID > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="ngayDi"
                            label="Ngay di"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input type="date" style={{ lineHeight: "21px" }} />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="ngayVe"
                            label="Ngay ve"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input type="date" style={{ lineHeight: "21px" }} />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="soLuongCon"
                            label="So luong con"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[0-9]\d*$/,
                                    message: "So luong >= 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={12}>
                        <Form.Item
                            name="ghiChu"
                            label="Ghi chu"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={12}>
                        <Form.Item
                            name="hinhAnh"
                            label="Hinh anh"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                </Row>

                <Row justify={"center"}>
                    <Form.Item>
                        <Button type="primary" htmlType="submit">
                            Submit
                        </Button>
                    </Form.Item>
                </Row>
            </Form>
        </Modal>
    )
}

export default StaffAcceptedDialog

/**
 *  {      
        "idTour" : 1
        "ngayDi": "2023-06-06",
        "ngayVe": "2019-06-10",
        "soLuongCon": 23,
        "ghiChu": "dsddsdsdsd",
        "hinhAnh": "YbhTzyNe2EuyMf3uPtC3JGdyR48ApRNX9l9hH5Qk.jpeg",
 }
 */

const StyledModal = styled(Modal)`
    .ant-modal-content{
        overflow: hidden;
        height: 90vh;
    }
    .ant-modal-body{
        min-height: 76vh;
        overflow: hidden;
    }

    .ant-modal-footer{
        position: absolute;
        bottom: 0;

    }

    input[type="date"] {
        line-height: 21px;
    }
`;